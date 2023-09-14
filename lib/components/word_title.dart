// ignore_for_file: prefer_const_constructors
import 'package:aac/constants.dart';
import 'package:flutter/material.dart';

class WordTitle extends StatefulWidget {
  final String title;
  final VoidCallback ttsButton;

  const WordTitle({
    super.key,
    required this.title,
    required this.ttsButton,
  });

  @override
  State<WordTitle> createState() => _WordTitleState();
}

class _WordTitleState extends State<WordTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 24, fontFamily: 'Medium', color: Color(0xFF393E41)),
          ),
          Material(
            color: Colors.white.withOpacity(0),
            child: IconButton(
              onPressed: widget.ttsButton,
              icon: Icon(
                Icons.volume_up,
                size: 30,
                color: contrast,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
