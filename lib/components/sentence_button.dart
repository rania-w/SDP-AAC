import 'package:flutter/material.dart';

class SentenceButton extends StatelessWidget {

  final String sentence;

  const SentenceButton({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Text(
              sentence,
              style: TextStyle(fontFamily: 'Medium', fontSize: 20, color: Color(0xFF393E41)),
            )),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.pressed)
              ? Color(0xFFDAB9B9)
              : Color(0xFFffecec)),
        ),
      ),
    );
  }
}


