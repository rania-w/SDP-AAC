// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final String imageAsset;
  final VoidCallback onPressed;
  const CustomImageInput(
      {super.key, required this.imageAsset, required this.onPressed});

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: IconButton(
        onPressed: widget.onPressed,
        icon: Image.file(
          File(widget.imageAsset),
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}
