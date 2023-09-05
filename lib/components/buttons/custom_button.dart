// ignore_for_file: prefer_const_constructors

import 'package:aac/constants.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/tts.dart';

///
/// issue with border color
///

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color defaultColor;
  final Color focusColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.defaultColor,
      required this.focusColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        onLongPress: () async {
          await tts.speak(widget.text);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Set border radius
              side: BorderSide(
                  color: widget.focusColor, width: 1.5), // Set border color
            ),
          ),
          padding:
              MaterialStateProperty.resolveWith((states) => EdgeInsets.all(20)),
          // textStyle: MaterialStateProperty.resolveWith((states) => paragraph),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                  ? widget.focusColor
                  : widget.defaultColor),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: black,
            fontFamily: 'Light',
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
