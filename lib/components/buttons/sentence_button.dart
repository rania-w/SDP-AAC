// ignore_for_file: prefer_const_constructors

import 'package:aac/constants.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/tts.dart';

class SentenceButton extends StatefulWidget {
  final String sentence;
  const SentenceButton({super.key, required this.sentence});

  @override
  State<SentenceButton> createState() => _SentenceButtonState();
}

class _SentenceButtonState extends State<SentenceButton> {
  void speak() async {
    await tts.speak(widget.sentence);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: accent),
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(white.withOpacity(0)),
          shadowColor: MaterialStateProperty.all<Color>(white.withOpacity(0)),
        ),
        onPressed: speak,
        child: Text(
          widget.sentence,
          style: paragraph,
        ),
      ),
    );
  }
}
