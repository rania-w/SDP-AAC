import 'package:flutter/material.dart';

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
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 7.5),
              width: 150,
              height: 150,
              // child: i.image,
              child: Image.asset(imageAsset),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }
}
