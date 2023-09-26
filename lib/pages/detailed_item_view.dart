import 'package:aac/components/buttons/sentence_button.dart';
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/services/boxes.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/word_title.dart';

class DetailedItemView extends StatefulWidget {
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
    late List<String>? sentences = [];

    if (word.sentences != null) {
      setState(() {
        sentences = word.sentences.toList();
      });
    }

    return Scaffold(
      appBar: appBar(word.word, true),
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
            Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ListView(
                children: sentences!.isNotEmpty
                    ? [
                        for (var i in word.sentences)
                          SentenceButton(sentence: i),
                      ]
                    : [
                        Text(
                          "Nema rečenica za ovu riječ",
                          style: paragraph.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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
