// ignore_for_file: prefer_const_constructors

import 'package:aac/constants.dart';
import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final String imageAsset;
  const CustomImageInput({super.key, required this.imageAsset});

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage(imageAsset),
            backgroundColor: white.withOpacity(1),
          ),
          Positioned(
            bottom: 45.0,
            right: 45.0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: black,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
