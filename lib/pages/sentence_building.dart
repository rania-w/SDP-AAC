// ignore_for_file: prefer_const_constructors

import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/components/input/custom_input.dart';
import 'package:aac/constants.dart';
import 'package:flutter/material.dart';

/// kako napraviti da ikonica ostane pri desnoj strani

class SentenceBuilding extends StatefulWidget {
  const SentenceBuilding({super.key});

  @override
  State<SentenceBuilding> createState() => _SentenceBuildingState();
}

class _SentenceBuildingState extends State<SentenceBuilding> {
  List<String> received = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomInput(
          onSelected: (selected) {
            setState(() {
              received.add(selected);
            });
          },
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i in received)
                Container(
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryF, width: 1.5)),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(i),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            received.remove(i);
                          });
                        },
                        icon: Icon(
                          Icons.close,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
              IconButton(
                  onPressed: () {
                    //tts
                  },
                  icon: Icon(Icons.volume_up))
            ],
          ),
        ),
        CustomButton(
          text: "Save sentence",
          onPressed: () {},
          defaultColor: green,
          focusColor: greenF,
        ),
      ],
    );
  }
}
