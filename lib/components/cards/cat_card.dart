// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../../objects/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  final String route;

  const CategoryCard({super.key, required this.category, required this.route});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                  ? Color(0xFFDAB9B9)
                  : Color(0xFFffecec)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, widget.route,
              arguments: {"words": widget.category.words});
        },
        child: Padding(
          padding: EdgeInsets.all(24),
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
                style: TextStyle(
                    fontFamily: 'Light',
                    fontSize: 16,
                    color: Color(0xFF393E41)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
