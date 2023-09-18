import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/components/cards/word_added.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class EditWord extends StatefulWidget {
  final Category category;
  const EditWord({super.key, required this.category});

  @override
  State<EditWord> createState() => _EditWordState();
}

class _EditWordState extends State<EditWord> {
  final _formKey = GlobalKey<FormState>();
  String word = '';
  String img = imageAsset;
  bool showIcons = false;
  late List boxWords = boxWord.values.toList();
  List<Word> words = [];
  // words = words.where((element) => false)

  @override
  void initState() {
    super.initState();
    words = boxWords.cast<Word>();
    words = words.where((element) {
      return widget.category.categoryId == element.categoryId;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Word newWord = Word(
      word: word,
      imageAsset: img,
      categoryId: widget.category.categoryId,
      sentences: [],
    );

    return Scaffold(
      appBar: appBar('Nova riječ', true),
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
                  /// text + img
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
                            setState(() => word = val);
                          },
                          decoration: textInputDecoration.copyWith(
                            label: const Text("Riječ"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          words.add(newWord);
                        });
                        debugPrint("deb: dodano");
                      }
                    },
                    child: Text(
                      'dodaj',
                      style: paragraph.copyWith(
                          decoration: TextDecoration.underline),
                    ),
                  ),

                  /// icons
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
                          icon: const Icon(Icons.close),
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
                          icon: const Icon(Icons.delete),
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
                            newWord.imageAsset = img;
                            newWord.word = word;
                            newWord.sentences = [];
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
      ),
    );
  }
}
