// ignore_for_file: prefer_const_constructors
import 'package:aac/components/buttons/sentence_button.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [SentenceButton(sentence: "Napravio sam rečenicu.")],
      ),
    );
  }
}
