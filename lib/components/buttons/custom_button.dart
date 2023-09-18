import 'package:aac/constants.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/tts.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        onLongPress: () async {
          await tts.speak(widget.text);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: widget.focusColor, width: 1.5),
            ),
          ),
          padding: MaterialStateProperty.resolveWith(
            (states) =>
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                  ? widget.focusColor
                  : widget.defaultColor),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: black,
            fontFamily: 'Light',
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
