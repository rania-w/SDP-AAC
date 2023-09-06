// ignore_for_file: prefer_const_constructors

import 'package:aac/objects/sentence.dart';
import 'package:aac/objects/user.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/services/populate.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/test.dart';
import 'package:aac/pages/home.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/boxes.dart';
import 'services/tts.dart';

/// the logic of the object and its appearance are (re: should be) seperate files

void main() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(SentenceAdapter());

    boxUser = await Hive.openBox<User>('boxUser');
    boxCategory = await Hive.openBox<Category>('boxCategory');
    boxWord = await Hive.openBox<Word>('boxWord');
    // boxSentence = await Hive.openBox<Sentence>('boxSentence');

    // temporary
    // await boxCategory.clear();
    // await boxUser.clear();
    // await boxWord.clear();
    // debugPrint("cleared");

    populate();
    // debugPrint(boxCategory.values.toString());
    // debugPrint(boxWord.values.toString());
  } catch (e) {
    debugPrint("hive exception: $e");
  }

  try {
    ttsConf(1, 1, 1, 'hr-HR');
  } catch (e) {
    debugPrint("tts exception: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: boxUser.isEmpty ? '/startup' : '/',
      // initialRoute: '/test',
      routes: {
        '/startup': (context) => Startup(),
        '/': (context) => Home(),
        '/test': (context) => Test(),
      },
    );
  }
}
