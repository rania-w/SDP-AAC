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
                  ? Color(0xffc1ccac)
                  : Color(0xff9ead7f))),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xFF393E41),
            fontFamily: 'Poppins-Light',
            fontSize: 16),
      ),
    );
  }
}
