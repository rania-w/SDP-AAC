// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/word_card.dart';
import 'package:aac/pages/detailed_item_view.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';
import '../../components/search.dart';
import 'package:aac/objects/word.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {
  Map data = {};
  List<Word> wordList = [];

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    for (var i in boxWord.values) {
      if (data['categoryId'] == i.categoryId) {
        wordList.add(i);
      }
    }
    // late var wordList = boxWord.values;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff393E41)),
        backgroundColor: Color(0xFFffecec),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Search(),
            for (var i in wordList)
              WordCard(
                word: i,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailedItemView(),
                      settings:
                          RouteSettings(arguments: {'wordId': i.wordId})));
                },
              )
          ],
        ),
      ),
    );
  }
}
