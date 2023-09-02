// ignore_for_file: prefer_const_constructors

import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/components/cards/word_added.dart';
import 'package:aac/components/input/image_input.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({super.key});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String catTitle = '';
  late Word word;
  List<Word> wordList = [];
  bool form = true;
  bool button = false;
  Map data = {};
  late Category category;

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    category = data['category'];
    wordList.addAll(category.words);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffecec),
        iconTheme: IconThemeData(color: black),
        title: const Text(
          "AAC",
          style: heading,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    CustomImageInput(
                      imageAsset: data['category'].imageAsset,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: data['category'].title,
                        validator: (val) =>
                            val!.isEmpty ? 'Polje ne može biti prazno' : null,
                        onChanged: (val) {
                          setState(() => catTitle = val);
                        },
                        decoration:
                            textInputDecoration.copyWith(label: Text("Naziv")),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: !button,
                  child: CustomButton(
                      text: "Dodaj riječi",
                      onPressed: () {
                        setState(() {
                          form = false;
                          button = true;
                        });
                      },
                      defaultColor: primary,
                      focusColor: primaryF),
                ),
                Visibility(
                  visible: !form,
                  child: Column(
                    children: [
                      // close button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  form = true;
                                  button = false;
                                });
                              }),
                              icon: Icon(Icons.close))
                        ],
                      ),
                      // image + text + add icon
                      Row(
                        children: [
                          CustomImageInput(imageAsset: imageAsset),
                          Expanded(
                            child: TextFormField(
                              validator: (val) => val!.isEmpty
                                  ? 'Polje ne može biti prazno'
                                  : null,
                              onChanged: (val) {
                                word = Word(
                                    imageAsset: imageAsset,
                                    word: val,
                                    sentences: [],
                                    categoryId: data['category'].categoryId);
                                // setState(() => word.word = val);
                              },
                              decoration: textInputDecoration.copyWith(
                                  label: Text("Riječ")),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  wordList.add(word);
                                });
                              }
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: wordList.isNotEmpty,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            wordList.clear();
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                    for (var i in wordList)
                      WordAdded(
                        word: i,
                        onPressed: () {
                          setState(() {
                            wordList.remove(i);
                          });
                        },
                      ),
                  ],
                ),
                //buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Nazad",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      defaultColor: white,
                      focusColor: greenF,
                    ),
                    CustomButton(
                      text: "Spasi",
                      onPressed: () {
                        // funkcija za add/update
                        if (_formKey.currentState!.validate()) {
                          category.imageAsset = imageAsset;
                          category.title = catTitle;
                          category.words = wordList;
                          boxCategory.put(category.categoryId, category);
                          for (var i in wordList) {
                            boxWord.put(i.wordId, i);
                          }
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => UDCategories())));
                      },
                      defaultColor: green,
                      focusColor: greenF,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
