import 'package:aac/pages/categories.dart';
import 'package:aac/pages/sentence_building.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/u_button.dart';
import 'package:aac/components/settings_item.dart';
import 'package:aac/pages/settings.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("test"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: UButton()
    );
  }
}
