import 'package:aac/components/cards/custom_card.dart';
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/cards/row_card.dart';
import 'package:aac/components/custom_button.dart';
import 'package:aac/components/search.dart';
import 'package:aac/components/sentence_button.dart';
import 'package:aac/components/word_title.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AAC"),
          backgroundColor: Color(0xFFFFECEC),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                WordTitle(title: "title")
              ],
            )));
  }
}