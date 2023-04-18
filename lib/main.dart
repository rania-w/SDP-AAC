// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_import, use_key_in_widget_constructors

import 'package:aac/category.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'customCard.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  List<Category> categories = [
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "family"),
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "favorites"),
    Category(
        image: /*Image.asset(*/ "resources/images/frog.jpeg" /*)*/,
        title: "food")
  ];

  //one object -- widget -- to return instead of container
  // the object will be comprised of the image and the title of the cateogry

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AAC"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //check how this looks on a phone
        child: ResponsiveGridList(
            desiredItemWidth: 200,
            squareCells: true,
            minSpacing: 30,
            children: categories.map((i) {
              //figure out a single card widget
              return CustomCard(
                title: i.title,
                imageAsset: i.image,
              );
            }).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }
}
