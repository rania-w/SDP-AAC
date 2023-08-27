//ignore_for_file: prefer_const_constructors

import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/objects/category.dart';
import 'package:flutter/material.dart';

import '../../objects/word.dart';

class UDSettingsItem extends StatefulWidget {
  final Category category;

  const UDSettingsItem({super.key, required this.category});

  @override
  State<UDSettingsItem> createState() => _UDSettingsItemState();
}

class _UDSettingsItemState extends State<UDSettingsItem> {
  List<Category> categories = [
    Category(
        imageAsset: "lib/resources/images/frog.jpeg",
        title: "title",
        words: [
          Word(word: "word 1", imageAsset: "lib/resources/images/frog.jpeg")
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xff393E41))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.drag_indicator)),
              CategoryCard(
                category: categories[0],
                route: '/add',
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
