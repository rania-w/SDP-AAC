import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/components/cards/row_card.dart';
import 'package:flutter/material.dart';
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
        imageAsset: /*Image.asset(*/ "lib/resources/images/frog.jpeg" /*)*/,
        title: "family",
        words: [Word(word: "word 1", imageAsset: "lib/resources/images/frog.jpeg"), Word(word: "radi!", imageAsset: "lib/resources/images/frog.jpeg")]),
    Category(
        imageAsset: /*Image.asset(*/ "lib/resources/images/frog.jpeg" /*)*/,
        title: "favorites",
        words: [Word(word: "word 1", imageAsset: "lib/resources/images/frog.jpeg")]),
    Category(
        imageAsset: /*Image.asset(*/ "lib/resources/images/frog.jpeg" /*)*/,
        title: "food",
        words: [Word(word: "word 1", imageAsset: "lib/resources/images/frog.jpeg")])
  ];

  @override
  Widget build(BuildContext context) {
    // const String i = '/lib/resources/images/frog.jpeg';
    return ListView(
      children: [
        const Search(),
        for (var i in categories) CategoryCard(category: i,)
      ],
    );
  }
}
