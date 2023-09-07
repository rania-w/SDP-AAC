// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/c-w/words.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/boxes.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final TextEditingController _searchController = TextEditingController();
  late var categories = boxCategory.values;
  List<dynamic> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = List.from(categories);
  }

  void filterObjects(String query) {
    setState(() {
      filtered = categories.where((category) {
        final name = category.title;
        return name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SearchBar(
            onChanged: (value) {
              filterObjects(value);
            },
            controller: _searchController,
            hintText: "Kategorija ili riječ",
            hintStyle: MaterialStateProperty.all(
                TextStyle(color: grey, fontFamily: 'Light')),
            trailing: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            backgroundColor: MaterialStateProperty.all(Color(0xFFFCFCFC)),
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
            side: MaterialStateProperty.all(
                const BorderSide(color: Color(0xFF393E41))),
          ),
          Column(
            children: filtered.map((i) {
              return CategoryCard(
                width: MediaQuery.of(context).size.width,
                category: i,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Words(),
                      settings: RouteSettings(
                          arguments: {'categoryId': i.categoryId})));
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
