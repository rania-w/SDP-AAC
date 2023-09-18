import 'package:aac/components/input/custom_input_dialog.dart';
import 'package:aac/components/settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/add-edit/ud_categories.dart';
import 'package:aac/pages/settings/accessibility/accessibility_settings.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var user = boxUser.get('user_key');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 32),
            child: Text(
              'Ćao, ${user.nickname}',
              style: heading,
            ),
          ),
          SettingsItem(
            name: "Kategorije",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UDCategories()));
            },
          ),
          SettingsItem(
            name: "Pristupačnost",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AccessibilitySettings(),
                ),
              );
            },
          ),
          SettingsItem(
            name: "Nadimak",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomInputDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
