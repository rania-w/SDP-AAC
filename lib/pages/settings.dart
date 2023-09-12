// ignore_for_file: prefer_const_constructors
import 'package:aac/components/input/custom_input_dialog.dart';
import 'package:aac/components/settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/pages/settings/accessibility/accessibility_settings.dart';
import 'package:flutter/material.dart';

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
          SettingsItem(
            name: "Kategorije",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UDCategories()));
            },
          ),
          SettingsItem(
            name: "Pristupačnost",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AccessibilitySettings()));
            },
          ),
          SettingsItem(
            name: "Nadimak",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomInputDialog(); // Your custom input dialog widget
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
