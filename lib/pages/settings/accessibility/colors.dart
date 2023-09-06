import 'package:aac/components/color_set.dart';
import 'package:aac/constants.dart';
import 'package:aac/palettes.dart';
import 'package:flutter/material.dart';

class ColorsSettings extends StatefulWidget {
  const ColorsSettings({super.key});

  @override
  State<ColorsSettings> createState() => _ColorsSettingsState();
}

class _ColorsSettingsState extends State<ColorsSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette().primary,
        title: Text(
          "Boje",
          style: heading,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ColorSet(palette: defaultPalette),
            ColorSet(palette: bluePalette),
            ColorSet(palette: highContrastPalette),
          ],
        ),
      ),
    );
  }
}
