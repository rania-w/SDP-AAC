// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/cat_card.dart';
import 'package:flutter/material.dart';
import '../components/search.dart';
import 'package:aac/services/boxes.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late var categories = boxCategory.values;
  @override
  Widget build(BuildContext context) {
    // const String i = '/lib/resources/images/frog.jpeg';
    return ListView(
      children: [
        Search(),
        for (var i in categories)
          CategoryCard(
            category: i,
            route: '/words',
          )
      ],
    );
  }
}
