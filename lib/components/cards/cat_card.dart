import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';
import '../../objects/category.dart';
import 'package:aac/constants.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  final VoidCallback onPressed;
  final double width;

  const CategoryCard(
      {super.key,
      required this.category,
      required this.onPressed,
      required this.width});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.pressed)
                ? primaryClicked
                : primary,
          ),
        ),
        onPressed: widget.onPressed,
        onLongPress: () async {
          tts.speak(widget.category.title);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  widget.category.imageAsset,
                  height: 52,
                  width: 52,
                ),
              ),
              Expanded(
                child: Text(
                  widget.category.title,
                  style: paragraph,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
