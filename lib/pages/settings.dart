// ignore_for_file: prefer_const_constructors
import 'package:aac/components/settings_item.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
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
        children: [
          Search(),
          SettingsItem(
            name: "Edit categories",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => UDCategories())));
            },
          ),
          SettingsItem(
            name: "Accessibility settings",
            onPressed: () {},
          ),
          SettingsItem(
            name: "Profile",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
