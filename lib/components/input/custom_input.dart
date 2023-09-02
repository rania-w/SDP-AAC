// ignore_for_file: prefer_const_constructors
import 'package:aac/constants.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

/// zasto ne nadje stvari kako treba??

class CustomInput extends StatefulWidget {
  final Function(String) onSelected;

  const CustomInput({super.key, required this.onSelected});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    List<String> wordList = [];
    for (var i in boxWord.values) {
      wordList.add(i.word);
    }
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
          color: white,
          border: Border.all(width: 1.5, color: black),
          borderRadius: BorderRadius.circular(10)),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return wordList.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
          widget.onSelected(selection);
        },
      ),
    );
  }
}
