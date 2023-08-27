// ignore_for_file: prefer_const_constructors
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
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ud_categories');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Color(0xffffffff).withOpacity(0)
                          : Color(0xffffffff).withOpacity(0)),
                  shadowColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Color(0xff9ead7f).withOpacity(0)
                          : Color(0xffc1ccac).withOpacity(0))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "setting item",
                  style: TextStyle(color: Color(0xff393E41)),
                ),
              ),
            )));
  }
}
