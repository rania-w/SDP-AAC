// ignore_for_file: prefer_const_constructors

import 'package:aac/components/settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/settings/accessibility/colors.dart';
import 'package:aac/pages/settings/accessibility/voice.dart';
import 'package:flutter/material.dart';

class AccessibilitySettings extends StatefulWidget {
  const AccessibilitySettings({super.key});

  @override
  State<AccessibilitySettings> createState() => _AccessibilitySettingsState();
}

class _AccessibilitySettingsState extends State<AccessibilitySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Pristupačnost"),
      body: ListView(
        children: [
          SettingsItem(
            name: "Boje",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ColorsSettings()));
              debugPrint("doživljavam te");
            },
          ),
          SettingsItem(
            name: "Zvuk",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VoiceSettings()));
            },
          ),
        ],
      ),
    );
    ;
  }
}
