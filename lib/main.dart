// ignore_for_file: prefer_const_constructors, unused_import

import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/pages/add.dart';
import 'package:aac/pages/categories.dart';
import 'package:aac/pages/detailed_item_view.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/pages/ud_categories.dart';
import 'package:aac/pages/words.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/test.dart';
import 'package:aac/pages/home.dart';
import 'package:aac/pages/settings.dart';

/// the logic of the object and its appearance are (re: should be) seperate files
void main() => runApp(MaterialApp(
      routes: {
        '/add': (context) => Add(),
        '/div': (context) => DetailedItemView(),
        '/sentence': (context) => SentenceBuilding(),
        '/startup': (context) => Startup(),
        '/categories': (context) => Categories(),
        '/words': (context) => Words(),
        '/test': (context) => Test(),
        '/settings': (context) => Settings(),
        '/ud_categories': (context) => UDCategories(),
        '/': (context) => Home(),
      },
      // initialRoute: '/test',
    ));
