// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aac/components/color_set.dart';
import 'package:aac/constants.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class ColorsSettings extends StatefulWidget {
  const ColorsSettings({super.key});

  @override
  State<ColorsSettings> createState() => _ColorsSettingsState();
}

class _ColorsSettingsState extends State<ColorsSettings> {
  var user = boxUser.get('user_key');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Uredi boje'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ColorSet(
              primary: Color(0xffFFECEC),
              accent: Color(0xffbacfbf),
              contrast: black,
              onPressed: () {
                // setDefaultPalette();
              },
            ),
            ColorSet(
              primary: Color(0xff87B8BC),
              accent: Color(0xffD28A8E),
              contrast: black,
              onPressed: () {
                // setBluePalette();
              },
            ),
            ColorSet(
              primary: Color(0xff00078C),
              accent: Color(0xff157500),
              contrast: white,
              onPressed: () {
                // setHighContrastPalette();
              },
            ),
          ],
        ),
      ),
    );
  }
}
