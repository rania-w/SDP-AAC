import 'package:aac/components/cards/word_card.dart';
import 'package:flutter/cupertino.dart';
import '../components/cards/row_card.dart';
import '../components/search.dart';
import 'package:aac/objects/word.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {

  List<Word> words = [
    Word(word: 'word', imageAsset: 'lib/resources/images/frog.jpeg')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Search(),
        /*for (var i in categories) */WordCard(word: words[0],)
      ],
    );
  }
}
