import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/custom_button.dart';
import 'package:aac/components/sentence_button.dart';
import 'package:aac/objects/sentence.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/word_title.dart';
// import 'package:aac/objects/word.dart';

class DetailedItemView extends StatefulWidget {
  // final Word word;

  // const DetailedItemView({super.key, required this.word});
  const DetailedItemView({super.key});

  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  List<Sentence> sentences = [
    Sentence(sentence: "This is a sentence"), //wordAssoc povlaci od word
    Sentence(sentence: "I like turtles"),
    Sentence(sentence: "Ona rečenica.")
  ];

  int bottomNavBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WordTitle(
          title: "Frog", // povuci od word
        ),
        const ImageCard(imageAsset: 'lib/resources/images/clu.jpeg'),
        //povuci od word
        Column(
          children: [
            for (var i in sentences) SentenceButton(sentence: i.sentence)
          ],
        ),
        const CustomButton(text: "New sentence...")
      ],
    );
  }
}
