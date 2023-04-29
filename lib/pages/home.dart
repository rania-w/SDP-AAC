import 'package:flutter/material.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:aac/custom_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("AAC"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
