import 'package:aac/components/custom_button.dart';
import 'package:aac/components/custom_input.dart';
import 'package:aac/components/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class SentenceBuilding extends StatefulWidget {
  const SentenceBuilding({super.key});

  @override
  State<SentenceBuilding> createState() => _SentenceBuildingState();
}

class _SentenceBuildingState extends State<SentenceBuilding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        ),
        body: const BaseLayout(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                CustomInput(),
                CustomButton(text: "Save sentence"),
              ],
            ),
          ),
        ));
  }
}
