// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AAC"),
          backgroundColor: Colors.pink,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            //check how this looks on a phone
            child: ResponsiveGridList(
                desiredItemWidth: 200,
                squareCells: true,
                minSpacing: 30,
                children: [
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                  16,
                  17,
                  18,
                  19,
                  20
                ].map((i) {
                  return Container(
                    alignment: Alignment(0, 0),
                    color: Colors.cyan,
                    child: Text(i.toString()),
                  );
                }).toList())));
  }
}
