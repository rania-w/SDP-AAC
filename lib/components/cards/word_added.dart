import 'package:aac/constants.dart';
import 'package:aac/objects/word.dart';
import 'package:flutter/material.dart';

class WordAdded extends StatefulWidget {
  final Word word;
  final VoidCallback onPressed;
  const WordAdded({super.key, required this.word, required this.onPressed});

  @override
  State<WordAdded> createState() => _WordAddedState();
}

class _WordAddedState extends State<WordAdded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary,
        border: Border.all(color: primaryClicked, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 80,
            ),
            IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Icons.close),
              alignment: AlignmentDirectional.topEnd,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    widget.word.imageAsset,
                    height: 52,
                    width: 52,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.word.word,
                    style: paragraph,
                  ),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
