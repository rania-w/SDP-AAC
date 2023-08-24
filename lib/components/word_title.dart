import 'package:flutter/material.dart';

///hot mess

class WordTitle extends StatelessWidget {
  final String title;

  const WordTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24, fontFamily: 'Medium', color: Color(0xFF393E41)),
          ),
          Material(
            color: Colors.white.withOpacity(0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border_outlined,
                  size: 30,
                  color: Color(0xff393E41),
                )),
          )
        ],
      ),
    );
  }
}
