// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/objects/category.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:aac/services/boxes.dart';

class UDCategories extends StatefulWidget {
  const UDCategories({super.key});

  @override
  State<UDCategories> createState() => _UDCategoriesState();
}

class _UDCategoriesState extends State<UDCategories> {
  late var categories = boxCategory.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffecec),
        iconTheme: IconThemeData(color: Color(0xff393E41)),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            for (var i in categories)
              UDSettingsItem(
                category: i,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff9EAD7F),
        child: Icon(
          Icons.add,
          color: Color(0xff393E41),
        ),
      ),
    );
  }
}
