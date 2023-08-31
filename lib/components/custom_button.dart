// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback func;

  const CustomButton({super.key, required this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? Color(0xff9ead7f)
                      : Color(0xffc1ccac))),
          onPressed: func,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              text,
              style: TextStyle(
                  color: Color(0xFF393E41), fontFamily: 'Light', fontSize: 16),
            ),
          )),
    );
  }
}
