import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/components/cards/word_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/services/boxes.dart';
import 'package:aac/services/tts.dart';
import 'package:flutter/material.dart';

class SentenceBuilding extends StatefulWidget {
  const SentenceBuilding({super.key});

  @override
  State<SentenceBuilding> createState() => _SentenceBuildingState();
}

class _SentenceBuildingState extends State<SentenceBuilding> {
  final TextEditingController _textController = TextEditingController();
  Word? temp;
  var words = boxWord.values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Izrazi se"),
                  controller: _textController,
                  cursorColor: contrast,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _textController.clear();
                  });
                },
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () async {
                  await tts.speak(_textController.text);
                },
                icon: const Icon(Icons.volume_up),
              ),
            ],
          ),
          CustomButton(
            text: "Spasi rečenicu",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Izaberi riječ"),
                    titleTextStyle:
                        paragraph.copyWith(fontWeight: FontWeight.bold),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ListView(
                        children: [
                          for (var i in words)
                            WordCard(
                              word: i,
                              onPressed: () {
                                setState(
                                  () {
                                    i.sentences.add(_textController.text);
                                    temp = i;
                                  },
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(
                          'Nazad',
                          style: paragraph.copyWith(fontSize: 12),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          boxWord.put(temp!.wordId, temp);
                        },
                        child: Text(
                          'Spasi promjene',
                          style: paragraph.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            defaultColor: accent,
            focusColor: accentClicked,
          ),
        ],
      ),
    );
  }
}
