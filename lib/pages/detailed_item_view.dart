// ignore_for_file: prefer_const_constructors

import 'package:aac/components/cards/image_card.dart';
import 'package:aac/components/custom_button.dart';
import 'package:aac/components/sentence_button.dart';
import 'package:aac/objects/sentence.dart';
import 'package:flutter/material.dart';
import 'package:aac/components/word_title.dart';
import 'package:aac/objects/word.dart';

///
/// treba margina dodat
/// treba ovaj title fixat ovo nista ne valja
///   nek se scusne malo
///

class DetailedItemView extends StatefulWidget {
  // final Word word;

  // const DetailedItemView({super.key, required this.word});
  const DetailedItemView({super.key});

  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  List<Sentence> sentences = [
    Sentence(sentence: "This is a sentence"), //wordAssoc povlaci od word
    Sentence(sentence: "I like turtles"),
    Sentence(sentence: "Ona rečenica.")
  ];

  int bottomNavBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AAC"),
        backgroundColor: Color(0xFFFFECEC),
      ),
      body: Column(
        children: [
          WordTitle(
            title: "Frog", // povuci od word
          ),
          ImageCard(imageAsset: 'lib/resources/images/frog.jpeg'), //povuci od word
          Column(
            children: [
              for (var i in sentences) SentenceButton(sentence: i.sentence)
            ],
          ),
          CustomButton(text: "New sentence...")
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "settings"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "build"),
        ],
        currentIndex: bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFCFC).withOpacity(0.8),
        iconSize: 32,
        // TODO moze bolje ovaj navbar al zasad radi svoje
        selectedItemColor: Color(0xFF393E41),
      ),
    );
  }
}
