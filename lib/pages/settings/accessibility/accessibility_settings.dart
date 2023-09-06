import 'package:aac/components/search.dart';
import 'package:aac/components/settings_item.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/settings/accessibility/colors.dart';
import 'package:aac/pages/settings/accessibility/voice.dart';
import 'package:aac/palettes.dart';
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Palette().contrast),
        backgroundColor: Palette().primary,
        centerTitle: true,
        title: Text(
          "Pristupačnost",
          style: heading,
        ),
      ),
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
