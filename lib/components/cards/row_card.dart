import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class RowCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const RowCard({super.key, required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                  ? Color(0xFFDAB9B9)
                  : Color(0xFFffecec)),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 24, 40, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset(
                  imageAsset,
                  height: 52,
                  width: 52,
                ),
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins-Light',
                      fontSize: 16,
                      color: Color(0xFF393E41)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
