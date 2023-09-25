import 'package:aac/objects/user.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/services/populate.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/boxes.dart';
import 'services/tts.dart';

void main() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(WordAdapter());

    boxUser = await Hive.openBox<User>('boxUser');
    boxCategory = await Hive.openBox<Category>('boxCategory');
    boxWord = await Hive.openBox<Word>('boxWord');

    populate();
  } catch (e) {
    debugPrint("hive exception: $e");
  }

  try {
    ttsConf(0.5, 1, 1, 'hr-HR');
  } catch (e) {
    debugPrint("tts exception: $e");
  }
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IzraziSe',
      debugShowCheckedModeBanner: false,
      initialRoute: boxUser.isEmpty ? '/startup' : '/',
      routes: {
        '/startup': (context) => const Startup(),
        '/': (context) => const Home(),
      },
    );
  }
}
