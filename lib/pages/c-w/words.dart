import 'package:aac/components/cards/word_card.dart';
import 'package:aac/constants.dart';
import 'package:aac/pages/detailed_item_view.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class Words extends StatefulWidget {
  final String categoryId;
  const Words({super.key, required this.categoryId});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {
  List<dynamic> filtered = [];
  late var words = boxWord.values.where((element) {
    return widget.categoryId == element.categoryId;
  }).toList();

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filtered = words;
  }

  void filterObjects(String query) {
    setState(() {
      filtered = words.where((word) {
        final name = word.word;
        return name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(boxCategory.get(widget.categoryId).title, true),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SearchBar(
              onChanged: (value) {
                filterObjects(value);
              },
              controller: _searchController,
              hintText: "Kategorija ili riječ",
              hintStyle: MaterialStateProperty.all(
                  const TextStyle(color: grey, fontFamily: 'Light')),
              trailing: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      filtered = words;
                      _searchController.text = '';
                    });
                  },
                ),
              ],
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFFCFCFC)),
              shape: MaterialStateProperty.all(
                const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Color(0xFF393E41))),
            ),
            Column(
              children: filtered.map((e) {
                return WordCard(
                  word: e,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailedItemView(),
                        settings:
                            RouteSettings(arguments: {'wordId': e.wordId})));
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
