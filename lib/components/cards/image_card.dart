import 'package:flutter/material.dart';

//no idea what this actually looks like

class ImageCard extends StatelessWidget {
  final String imageAsset;

  const ImageCard({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      width: 120,
      height: 120,
    );
  }
}
