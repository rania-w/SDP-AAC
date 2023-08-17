import 'package:flutter/material.dart';

/// doesnt look great, doesnt look terrible

class CustomCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const CustomCard({super.key, required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? Colors.yellow[400]
                    : Colors.yellow[300])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Image.asset(imageAsset, width: 52, height: 52,),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
