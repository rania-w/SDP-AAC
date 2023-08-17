import 'package:flutter/material.dart';

class WordTitle extends StatelessWidget {
  final String title;

  const WordTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins-Medium',
                color: Color(0xFF393E41)),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.star_border_outlined))
        ],
      ),
    );
  }
}
