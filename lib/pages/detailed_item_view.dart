// ignore_for_file: prefer_const_constructors
import 'package:aac/components/buttons/sentence_button.dart';
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/home.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/palettes.dart';
import 'package:aac/services/boxes.dart';
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Palette().contrast),
        backgroundColor: Palette().primary,
        centerTitle: true,
        title: Text(
          word.word,
          style: heading,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            WordTitle(
              // title: data['title'], // povuci od word
              title: word.word,
            ),
            ImageCard(imageAsset: word.imageAsset),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            //povuci od word
            Column(
              children: [
                for (var i in word.sentences) SentenceButton(sentence: i)
              ],
            ),
            CustomButton(
              text: "Nova rečenica",
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Home(),
                    settings: RouteSettings(arguments: {'index': 2})));
              },
              defaultColor: green,
              focusColor: greenF,
            )
          ],
        ),
      ),
    );
  }
}
