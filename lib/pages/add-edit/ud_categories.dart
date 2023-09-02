// ignore_for_file: prefer_const_constructors
import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/add-edit/add_edit_page_template.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: primary,
        iconTheme: IconThemeData(color: black),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: black),
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
        onPressed: () {
          // Navigator.pushNamed(context, '/add', arguments: {'initialData': ''});
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add()));
        },
        backgroundColor: green,
        child: Icon(
          Icons.add,
          color: black,
        ),
      ),
    );
  }
}
