import 'package:flutter/material.dart';

class SentenceBuilding extends StatefulWidget {
  const SentenceBuilding({super.key});

  @override
  State<SentenceBuilding> createState() => _SentenceBuildingState();
}

class _SentenceBuildingState extends State<SentenceBuilding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("SentenceBuilding"),
    );
  }
}
