// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:aac/components/buttons/sentence_button.dart';
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/services/boxes.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/word_title.dart';

class DetailedItemView extends StatefulWidget {
  // final Word word;

  // const DetailedItemView({super.key, required this.word});
  const DetailedItemView({super.key});

  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    late var word = boxWord.get(data['wordId']);
    late var sentences = word.sentences.toList();
    return Scaffold(
      appBar: appBar(word.word),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            WordTitle(
              title: word.word,
              ttsButton: () async {
                await tts.speak(word.word);
              },
            ),
            ImageCard(imageAsset: word.imageAsset),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Column(
              children: sentences.isEmpty
                  ? [for (var i in word.sentences) SentenceButton(sentence: i)]
                  : [
                      Text(
                        "Nema rečenica za ovu riječ",
                        style: paragraph.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
