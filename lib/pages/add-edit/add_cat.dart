// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  /// cat image + textform
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: IconButton(
                          iconSize: 52,
                          icon: Image.asset(img),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        alignment: Alignment(1, 0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Polje ne može biti prazno' : null,
                          onChanged: (val) {
                            setState(() => catTitle = val);
                          },
                          decoration: textInputDecoration.copyWith(
                            label: Text("Naziv"),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// image menu
                  Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.85,
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
                    ],
                  ),

                  /// add words button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          /// add word page
                          /// salje probz argument categoryId
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Category category = Category(
                                imageAsset: img, title: catTitle, words: []);
                            boxCategory.put(category.categoryId, category);
                            debugPrint("deb img: ${category.imageAsset}");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UDCategories()));
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
