// ignore_for_file: prefer_const_constructors
import 'package:aac/objects/category.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/resources/a_a_c_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/categories.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/pages/settings.dart';
import 'package:hive/hive.dart';
import 'package:aac/services/boxes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Box<Category> boxCategory;

  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return boxCategory.isEmpty
        ? Startup()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff393E41)),
              backgroundColor: Color(0xFFffecec),
              title: const Text(
                "AAC",
                style:
                    TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
              ),
            ),
            body: Padding(
                padding: EdgeInsets.all(20),
                child: <Widget>[
                  Settings(),
                  Categories(),
                  SentenceBuilding(),
                ][currentPageIndex]),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(AACIcons.settingFilled),
                  icon: Icon(AACIcons.settings),
                  label: 'Settings',
                ),
                NavigationDestination(
                  selectedIcon: Icon(AACIcons.homeFilled),
                  icon: Icon(AACIcons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(AACIcons.puzzleFilled),
                  icon: Icon(AACIcons.puzzle),
                  label: 'Speak',
                ),
              ],
            ),
          );
  }
}
