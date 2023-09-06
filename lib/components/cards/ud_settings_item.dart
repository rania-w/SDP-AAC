//ignore_for_file: prefer_const_constructors

import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/pages/add-edit/edit_cat.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/boxes.dart';

class UDSettingsItem extends StatefulWidget {
  final Category category;

  const UDSettingsItem({super.key, required this.category});

  @override
  State<UDSettingsItem> createState() => _UDSettingsItemState();
}

class _UDSettingsItemState extends State<UDSettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xff393E41))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.drag_indicator)),
              CategoryCard(
                category: widget.category,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditCategory(),
                      settings: RouteSettings(
                          arguments: {'category': widget.category}),
                    ),
                  );
                },
              )
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  boxCategory.delete(widget.category.categoryId);
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
