// ignore_for_file: prefer_const_constructors

import 'package:aac/components/row_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import '../components/search.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Category> categories = [
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "family",
        words: [Word(word: "word 1", image: "resources/images/frog.jpeg")]),
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "favorites",
        words: [Word(word: "word 1", image: "resources/images/frog.jpeg")]),
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "food",
        words: [Word(word: "word 1", image: "resources/images/frog.jpeg")])
  ];

  @override
  Widget build(BuildContext context) {
    // const String i = '/resources/images/frog.jpeg';
    return Scaffold(
      appBar: AppBar(
        title: const Text("AAC"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Search(),
            //TODO: iter
            RowCard(title: "title", imageAsset: "imageAsset")
          ],
        ),
        //check how this looks on a phone - dreadful, better on tablet
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Color(0xFF9ead7f),
        backgroundColor: Color(0xFFc1ccac),
        child: const Icon(Icons.add, color: Color(0xFF393E41),),
      ),
    );
  }
}
