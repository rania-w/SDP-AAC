import 'package:flutter/material.dart';

//no idea what this actually looks like

class ImageCard extends StatelessWidget {
  final String imageAsset;
  const ImageCard({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? Colors.yellow[400]
                    : Colors.yellow[300])),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Image.asset(imageAsset, height: 60, width: 60,),
        ),
      ),
    );
  }
}
