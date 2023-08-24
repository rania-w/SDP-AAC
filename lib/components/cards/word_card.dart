import 'package:flutter/material.dart';

import '../../objects/word.dart';

class WordCard extends StatefulWidget {
  final Word word;
  const WordCard({super.key, required this.word});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.pressed)
              ? Color(0xFFDAB9B9)
              : Color(0xFFffecec)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/div', arguments: {
            'word': widget.word
          });
        },
        child: Padding(
          padding: EdgeInsets.all(24),
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
              Container(
                child: Text(
                  widget.word.word,
                  style: TextStyle(
                      fontFamily: 'Light',
                      fontSize: 16,
                      color: Color(0xFF393E41)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
