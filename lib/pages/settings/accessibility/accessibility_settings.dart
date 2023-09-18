import 'package:aac/components/settings_item.dart';
import 'package:aac/constants.dart';
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
      appBar: appBar("Pristupačnost", true),
      body: ListView(
        children: [
          // SettingsItem(
          //   name: "Font",
          //   onPressed: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => FontSettings()));
          //   },
          // ),
          SettingsItem(
            name: "Glas",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VoiceSettings()));
            },
          ),
        ],
      ),
    );
  }
}
