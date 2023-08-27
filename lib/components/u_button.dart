// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'cards/row_card.dart';

class UButton extends StatefulWidget {
  const UButton({super.key});

  @override
  State<UButton> createState() => _UButtonState();
}

class _UButtonState extends State<UButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      onLongPress: () {
        // move it around
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.pressed)
                ? Colors.white.withOpacity(1)
                : Colors.white.withOpacity(1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.drag_indicator,
                    color: Color(0xFF393E41),
                  )),
              RowCard(
                  title: "title", imageAsset: "lib/resources/images/clu.jpeg"),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Color(0xFF393E41),
            ),
          )
        ],
      ),
    );
  }
}
