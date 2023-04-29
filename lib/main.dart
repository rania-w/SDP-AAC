// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_import, use_key_in_widget_constructors

import 'package:aac/category.dart';
import 'package:aac/word.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'custom_card.dart';

void main() => runApp(MaterialApp(
      home: CategoriesPage(),
    ));

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  /// hardcoded
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

  /// the logic of the object and its appearance are (re: should be) seperate files

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AAC"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        //check how this looks on a phone - dreadful, better on tablet
        child: ResponsiveGridList(
            desiredItemWidth: 180,
            squareCells: true,
            minSpacing: 20,
            children: categories.map((i) {
              return CustomCard(
                title: i.title,
                imageAsset: i.image,
              );
            }).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }
}
