// ignore_for_file: prefer_const_constructors
import 'package:aac/constants.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';
import '../../objects/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  // final String route;
  final VoidCallback onPressed;

  const CategoryCard(
      {super.key,
      required this.category,
      // required this.route,
      required this.onPressed});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) =>
                states.contains(MaterialState.pressed) ? primaryF : primary,
          ),
        ),
        onPressed: widget.onPressed,
        onLongPress: () async {
          tts.speak(widget.category.title);
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Image.asset(
                  widget.category.imageAsset,
                  height: 52,
                  width: 52,
                ),
              ),
              Text(
                widget.category.title,
                style: paragraph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
