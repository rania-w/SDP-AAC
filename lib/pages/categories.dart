import 'package:aac/components/cards/row_card.dart';
import 'package:aac/components/layouts/base_layout.dart';
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

  int _bottomNavBarIndex = 1;
  int get bottomNavBarIndex => _bottomNavBarIndex;

  @override
  Widget build(BuildContext context) {
    // const String i = '/resources/images/frog.jpeg';
    return BaseLayout(
      child: Column(
        children: [
          const Search(),
          for (var i in categories) RowCard(title: i.title, imageAsset: i.image)
        ],
      ),
    );
  }
}
