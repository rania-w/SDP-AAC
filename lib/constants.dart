import 'package:aac/palettes.dart';
import 'package:flutter/material.dart';

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

const black = Color(0xff393E41);
const white = Color(0xfffcfcfc);
const primary = Color(0xffFFECEC);
const primaryF = Color(0xffDAB9B9);
const green = Color(0xffbacfbf);
const greenF = Color(0xffa8bcad);
const grey = Color(0xff8E9999);
const imageAsset = 'lib/resources/images/frog.jpeg';

var appBar = AppBar(
  backgroundColor: primary,
  iconTheme: IconThemeData(color: black),
  title: Text(
    "AAC",
    style: heading.copyWith(fontFamily: 'Medium'),
  ),
);

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

Palette defaultPalette = Palette();
Palette bluePalette = Palette().setBlue();
Palette highContrastPalette = Palette().setHighContrast();
