import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Kategorija ili riječ",
      hintStyle: MaterialStateProperty.all(TextStyle(
          color: Color(0xFF8E9999), fontFamily: 'Light')),
      trailing: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      backgroundColor: MaterialStateProperty.all(Color(0xFFFCFCFC)),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
      side:
          MaterialStateProperty.all(const BorderSide(color: Color(0xFF393E41))),
    );
  }
}
