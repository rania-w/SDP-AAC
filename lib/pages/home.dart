// ignore_for_file: prefer_const_constructors
import 'package:aac/constants.dart';
import 'package:aac/pages/startup.dart';
import 'package:aac/resources/a_a_c_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/c-w/categories.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/pages/settings.dart';
import 'package:aac/services/boxes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    if (data['index'] != null) currentPageIndex = data['index'];
    return boxCategory.isEmpty
        ? Startup()
        : Scaffold(
            appBar: appBar(''),
            body: Container(
                // padding: EdgeInsets.all(20),
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
                  label: 'Postavke',
                ),
                NavigationDestination(
                  selectedIcon: Icon(AACIcons.homeFilled),
                  icon: Icon(AACIcons.home),
                  label: 'Početna',
                ),
                NavigationDestination(
                  selectedIcon: Icon(AACIcons.puzzleFilled),
                  icon: Icon(AACIcons.puzzle),
                  label: 'Izrazi se',
                ),
              ],
            ),
          );
  }
}
