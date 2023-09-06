import 'package:aac/palettes.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ColorSet extends StatefulWidget {
  final Palette palette;

  const ColorSet({super.key, required this.palette});

  @override
  State<ColorSet> createState() => _ColorSetState();
}

class _ColorSetState extends State<ColorSet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(grey),
          backgroundColor: MaterialStateProperty.all(
            white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(width: 2, color: grey),
            ),
          ),
        ),
        onPressed: () {
          // change the palette
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *
                  0.1, // Adjust the size as needed
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.palette.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Adjust the shadow's offset
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.1, // Adjust the size as needed
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.palette.accent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Adjust the shadow's offset
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.1, // Adjust the size as needed
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.palette.contrast,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Adjust the shadow's offset
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
