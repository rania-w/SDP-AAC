import 'package:aac/components/cards/row_card.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatefulWidget {
  final String name;

  const SettingsItem({super.key, required this.name});

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF393E41)),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text("setting")
      ),
    );
  }
}
