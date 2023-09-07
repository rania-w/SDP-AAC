// ignore_for_file: prefer_const_constructors
import 'package:aac/constants.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';
import 'package:aac/objects/word.dart';

class WordCard extends StatefulWidget {
  final Word word;
  final VoidCallback onPressed;

  const WordCard({super.key, required this.word, required this.onPressed});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                  ? primaryClicked
                  : primary),
        ),
        onPressed: widget.onPressed,
        onLongPress: () async {
          await tts.speak(widget.word.word);
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Image.asset(
                  widget.word.imageAsset,
                  height: 52,
                  width: 52,
                ),
              ),
              Text(
                widget.word.word,
                style: paragraph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
