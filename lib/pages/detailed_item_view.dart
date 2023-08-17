// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailedItemView extends StatefulWidget {
  const DetailedItemView({super.key});

  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AAC"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Frog',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Icon(Icons.star_outline_rounded)
                ],
              ),
              Row()
            ]),
      ),
    );
  }
}
