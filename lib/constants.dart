import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: black, width: 2.0),
  ),
);

const black = Color(0xff393E41);
const white = Color(0xfffcfcfc);
const primary = Color(0xffFFECEC);
const primaryF = Color(0xffDAB9B9);
const green = Color(0xffC1CCAC);
const greenF = Color(0xff9EAD7F);
const grey = Color(0xff8E9999);
const imageAsset = 'lib/resources/images/frog.jpeg';

var appBar = AppBar(
  backgroundColor: primary,
  iconTheme: IconThemeData(color: black),
  title: Text(
    "AAC",
    style: textStyle.copyWith(fontFamily: 'Medium'),
  ),
);

const textStyle = TextStyle(color: black);
