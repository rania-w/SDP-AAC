// ignore_for_file: prefer_const_constructors, unused_import
import 'package:aac/components/cards/cat_card.dart';
import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/cards/row_card.dart';
import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/components/cards/word_card.dart';
import 'package:aac/components/word_title.dart';
import 'package:aac/pages/categories.dart';
import 'package:aac/pages/detailed_item_view.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/u_button.dart';
import 'package:aac/components/settings_item.dart';
import 'package:aac/pages/settings.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Padding(padding: EdgeInsets.all(20), child: Placeholder()));
  }
}
