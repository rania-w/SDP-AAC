import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/components/cards/word_added.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AddWord extends StatefulWidget {
  final Category category;
  const AddWord({super.key, required this.category});

  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();
  String word = '';
  String img = imageAsset;
  List<Word> words = [];
  bool showIcons = false;
  @override
  Widget build(BuildContext context) {
    Word newWord = Word(
        word: word, imageAsset: img, categoryId: widget.category.categoryId);
    return Scaffold(
        appBar: appBar('Nova riječ'),
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
                    /// text + img
                    Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: IconButton(
                            iconSize: 52,
                            icon: Image.asset(img),
                            onPressed: () {
                              // da se pojavi onaj menu koji se sad svakako pojavljuje
                              setState(() {
                                showIcons = true;
                              });
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment(1, 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            validator: (val) => val!.isEmpty
                                ? 'Polje ne može biti prazno'
                                : null,
                            onChanged: (val) {
                              setState(() => word = val);
                            },
                            decoration: textInputDecoration.copyWith(
                              label: Text("Riječ"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          words.add(newWord);
                        });
                      },
                      child: Text(
                        'dodaj',
                        style: paragraph.copyWith(
                            decoration: TextDecoration.underline),
                      ),
                    ),

                    /// icons - should be visibility
                    Visibility(
                      visible: showIcons,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.75,
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
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: words.isNotEmpty,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView(
                              children: [
                                for (var i in words)
                                  WordAdded(
                                    word: i,
                                    onPressed: () {
                                      setState(() {
                                        words.remove(i);
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                words.clear();
                              });
                            },
                          )
                        ],
                      ),
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
                              newWord.imageAsset = img;
                              newWord.word = word;
                              widget.category.words = words;
                              boxCategory.put(
                                  widget.category.categoryId, widget.category);
                              for (Word i in words) {
                                boxWord.put(i.wordId, i);
                              }
                              Navigator.pop(context, widget.category);
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
        ));
  }
}
