import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/pages/add-edit/add_word.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  String catTitle = '';
  String img = imageAsset;
  String receivedBack = '';
  bool showIcons = false;
  var temp;

  @override
  Widget build(BuildContext context) {
    Category category = Category(imageAsset: img, title: catTitle, words: []);
    return Scaffold(
      appBar: appBar("Nova kategorija", true),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  /// cat image + textform
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: IconButton(
                          iconSize: 52,
                          icon: Image.asset(img),
                          onPressed: () {
                            setState(() {
                              showIcons = true;
                            });
                          },
                        ),
                      ),
                      Container(
                        alignment: const Alignment(1, 0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Polje ne može biti prazno' : null,
                          onChanged: (val) {
                            setState(() => catTitle = val);
                          },
                          decoration: textInputDecoration.copyWith(
                            label: const Text("Naziv"),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// image menu
                  Visibility(
                    visible: showIcons,
                    child: Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.77,
                          child: ResponsiveGridList(
                            desiredItemWidth: 100,
                            children: images.entries.map((e) {
                              return IconButton(
                                onPressed: () {
                                  setState(() {
                                    img = e.value;
                                  });
                                },
                                icon: Image.asset(e.value),
                                iconSize: 48,
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showIcons = false;
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),

                  /// add words button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          temp = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddWord(
                                category: category,
                              ),
                            ),
                          );
                          if (temp != null) {
                            setState(() {
                              receivedBack = temp.categoryId;
                            });
                          }
                        },
                        child: Text(
                          "Riječi",
                          style: paragraph.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Nazad",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        defaultColor: white,
                        focusColor: accentClicked,
                      ),
                      CustomButton(
                        text: "Spasi promjene",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            category.imageAsset = img;
                            category.title = catTitle;
                            if (receivedBack != '') {
                              boxCategory.put(receivedBack, temp);
                            } else {
                              boxCategory.put(category.categoryId, category);
                            }
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UDCategories()));
                          }
                        },
                        defaultColor: accent,
                        focusColor: accentClicked,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
