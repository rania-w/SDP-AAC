import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/add-edit/add_cat.dart';
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
      appBar: appBar('Kategorije', true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            for (var i in categories)
              UDSettingsItem(
                category: i,
                onPressed: () {
                  setState(() {
                    boxCategory.delete(i.categoryId);
                  });
                },
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/add', arguments: {'initialData': ''});
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddCategory()));
        },
        backgroundColor: accent,
        child: Icon(
          Icons.add,
          color: contrast,
        ),
      ),
    );
  }
}
