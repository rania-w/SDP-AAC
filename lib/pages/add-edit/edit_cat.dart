import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/pages/add-edit/edit_word.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class EditCategory extends StatefulWidget {
  final String categoryId;
  const EditCategory({super.key, required this.categoryId});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  late Category category = boxCategory.get(widget.categoryId);
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String img = imageAsset;
  List words = [];
  String receivedBack = '';
  var temp;
  bool showIcons = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      title = category.title;
      img = category.imageAsset;
      words = category.words;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(category.title, true),
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
                          initialValue: title,
                          validator: (val) =>
                              val!.isEmpty ? 'Polje ne može biti prazno' : null,
                          onChanged: (val) {
                            setState(() => title = val);
                          },
                          decoration: textInputDecoration.copyWith(
                            label: const Text("Naziv"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showIcons,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: grey
                                    .withOpacity(0.5), // Set the shadow color
                                spreadRadius: 2, // Set the spread radius
                                blurRadius: 5, // Set the blur radius
                                offset:
                                    const Offset(0, 3), // Set the shadow offset
                              ),
                            ],
                          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          temp = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditWord(
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
                            category.title = title;
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
