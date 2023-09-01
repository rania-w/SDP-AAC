// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffecec),
        iconTheme: IconThemeData(color: Color(0xff393E41)),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            WordTitle(
              // title: data['title'], // povuci od word
              title: data['word'].word,
            ),
            ImageCard(imageAsset: data['word'].imageAsset),
            //povuci od word
            Column(
              children: [
                for (var i in data['word'].sentences)
                  CustomButton(
                    text: i.sentence,
                    onPressed: () {},
                    defaultColor: green,
                    focusColor: greenF,
                  )
              ],
            ),
            CustomButton(
              text: "New sentence...",
              onPressed: () {},
              defaultColor: green,
              focusColor: greenF,
            )
          ],
        ),
      ),
    );
  }
}
