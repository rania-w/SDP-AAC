// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Color grey = Color(0xff8E9999);
const Color black = Color(0xff393E41);
const Color white = Color(0xfffcfcfc);

Color primary = Color(0xffFFECEC);
Color primaryClicked = Color(0xffDAB9B9);
Color accent = Color(0xffbacfbf);
Color accentClicked = Color(0xffa8bcad);
Color contrast = black;

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: grey, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: black, width: 2.0),
  ),
  labelStyle: TextStyle(color: grey),
);

const imageAsset = 'lib/resources/images/frog.jpeg';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: primary,
    centerTitle: true,
    title: Text(
      title,
      style: heading,
    ),
    iconTheme: IconThemeData(color: contrast),
  );
}

const paragraph = TextStyle(
  color: black,
  fontFamily: 'Light',
  fontSize: 16,
);
const heading = TextStyle(
  color: black,
  fontSize: 24,
  fontFamily: 'Medium',
);
