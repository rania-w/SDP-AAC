import 'package:aac/components/settings_item.dart';
import 'package:flutter/material.dart';
import '../components/search.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Search(),
          SettingsItem(name: "name"),
          SettingsItem(name: "name"),
          SettingsItem(name: "name"),
          SettingsItem(name: "name"),
          SettingsItem(name: "name"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff9EAD7F),
        child: Icon(
          Icons.add,
          color: Color(0xff393E41),
        ),
      ),
    );
  }
}
