// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/pages/c-w/words.dart';
import 'package:flutter/material.dart';
import '../../components/search.dart';
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
    return ListView(
      children: [
        Search(),
        for (var i in categories)
          CategoryCard(
            category: i,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Words(),
                  settings:
                      RouteSettings(arguments: {'categoryId': i.categoryId})));
            },
          ),
      ],
    );
  }
}
