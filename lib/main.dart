// ignore_for_file: prefer_const_constructors, unused_import

import 'package:aac/components/cards/ud_settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/user.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
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
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'services/boxes.dart';

/// the logic of the object and its appearance are (re: should be) seperate files

void main() async {
  List<Word> favWords = [];
  List<Word> emocijeWords = [
    Word(word: "Sreća", imageAsset: imageAsset),
    Word(word: 'Tuga', imageAsset: imageAsset),
    Word(word: 'Ljutnja', imageAsset: imageAsset),
    Word(word: "Umor", imageAsset: imageAsset),
    Word(word: 'Zbunjenost', imageAsset: imageAsset),
    Word(word: "Mučnina", imageAsset: imageAsset),
  ];
  List<Word> konverzacijaWords = [
    Word(word: "Ćao", imageAsset: imageAsset),
    Word(word: 'Ja', imageAsset: imageAsset),
    Word(word: 'Da', imageAsset: imageAsset),
    Word(word: 'Ne', imageAsset: imageAsset),
    Word(word: 'Ti', imageAsset: imageAsset),
    Word(word: 'Izvini', imageAsset: imageAsset),
    Word(word: "Ponovi", imageAsset: imageAsset),
    Word(word: 'Pogledaj', imageAsset: imageAsset),
    Word(word: 'Upomoć', imageAsset: imageAsset)
  ];
  // porodica
  // moje rijeci prazna lista

  // default categories
  List<Category> defaultCategories = [
    Category(imageAsset: imageAsset, title: "Favs", words: favWords),
    Category(imageAsset: imageAsset, title: 'Emocije', words: emocijeWords),
    Category(
        imageAsset: imageAsset, title: 'Konverzacija', words: konverzacijaWords)
  ];

  // default words per category

  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(WordAdapter());
    boxCategory = await Hive.openBox<Category>('categoryBox');
    for (var i in defaultCategories) {
      boxCategory.put('key_${i.title}', i);
    }
    print(boxCategory.values);
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
        '/': (context) => Home(), //??????????????????
      },
      // initialRoute: '/test',
    );
  }
}
