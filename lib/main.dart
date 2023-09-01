// ignore_for_file: prefer_const_constructors, unused_import

import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/sentence.dart';
import 'package:aac/objects/user.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/pages/add-edit/add.dart';
import 'package:aac/pages/c-w/categories.dart';
import 'package:aac/pages/detailed_item_view.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/pages/c-w/words.dart';
import 'package:aac/services/populate.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/test.dart';
import 'package:aac/pages/home.dart';
import 'package:aac/pages/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'services/boxes.dart';

/// the logic of the object and its appearance are (re: should be) seperate files

void main() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(SentenceAdapter());
    // Box<Category> boxCategory;
    boxUser = await Hive.openBox<User>('boxUser');
    boxCategory = await Hive.openBox<Category>('boxCategory');
    // boxWord = await Hive.openBox<Word>('boxWord');
    // boxSentence = await Hive.openBox<Sentence>('boxSentence');

    // temporary
    // await boxCategory.clear();
    // await boxUser.clear();
    // print("cleared");
    populate();
    // print(boxCategory.values);
  } catch (e) {
    print(e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: boxUser.isEmpty ? '/startup' : '/',
      // initialRoute: '/words',
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
    );
  }
}
