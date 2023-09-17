//ignore_for_file: prefer_const_constructors

import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/pages/add-edit/edit_cat.dart';
import 'package:flutter/material.dart';

class UDSettingsItem extends StatefulWidget {
  final Category category;
  final VoidCallback onPressed;

  const UDSettingsItem(
      {super.key, required this.category, required this.onPressed});

  @override
  State<UDSettingsItem> createState() => _UDSettingsItemState();
}

class _UDSettingsItemState extends State<UDSettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: contrast)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CategoryCard(
                width: MediaQuery.of(context).size.width * 0.62,
                category: widget.category,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditCategory(categoryId: widget.category.categoryId),
                    ),
                  );
                },
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onPressed,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
