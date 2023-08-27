// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/word_card.dart';
import 'package:flutter/material.dart';
import '../components/search.dart';
import 'package:aac/objects/word.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {

  List<Word> wordList = [];

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = (ModalRoute.of(context)?.settings.arguments??{}) as Map;

    wordList = data['words'];

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
            // /*for (var i in categories) */WordCard(word: words[0],)
            // WordCard(word: wordList)
            for(var i in wordList) WordCard(word: i)
          ],
        ),
      ),
    );
  }
}
