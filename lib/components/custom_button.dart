import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? Color(0xff9ead7f)
                    : Color(0xffc1ccac))),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,10,20,10),
          child: Text(
            text,
            style: TextStyle(
                color: Color(0xFF393E41), fontFamily: 'Light', fontSize: 16),
          ),
        ));
  }
}
