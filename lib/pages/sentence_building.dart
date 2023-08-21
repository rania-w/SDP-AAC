import 'package:aac/components/custom_button.dart';
import 'package:aac/components/custom_input.dart';
import 'package:flutter/material.dart';

class SentenceBuilding extends StatefulWidget {
  const SentenceBuilding({super.key});

  @override
  State<SentenceBuilding> createState() => _SentenceBuildingState();
}

class _SentenceBuildingState extends State<SentenceBuilding> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomInput(),
        CustomButton(text: "Save sentence"),
      ],
    );
  }
}
