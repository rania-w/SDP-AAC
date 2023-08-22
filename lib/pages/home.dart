import 'package:aac/resources/a_a_c_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:aac/pages/categories.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:aac/pages/settings.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffecec),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
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
            selectedIcon: Icon(AACIcons.icons8_settings_filled),
            icon: Icon(AACIcons.icons8_settings),
            label: 'Settings',
          ),
          NavigationDestination(
            selectedIcon: Icon(AACIcons.icons8_home_filled),
            icon: Icon(AACIcons.icons8_home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(AACIcons.icons8_puzzle_filled),
            icon: Icon(AACIcons.icons8_puzzle),
            label: 'Speak',
          ),
        ],
      ),
    );
  }
}
