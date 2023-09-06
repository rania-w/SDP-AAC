import 'package:flutter/material.dart';

class Palette {
  Color primary = Color(0xffFFECEC);
  Color primaryFocus = Color(0xffDAB9B9);
  Color accent = Color(0xffbacfbf);
  Color accentFocus = Color(0xffa8bcad);
  Color contrast = Color(0xff393E41);

  Palette setBlue() {
    this.primary = Color(0xff87B8BC);
    this.primaryFocus = Color(0xff75a6aa);
    this.accent = Color(0xffD28A8E);
    this.accentFocus = Color(0xffbb757a);
    return this;
  }

  Palette setHighContrast() {
    this.primary = Color(0xff00078C);
    this.primaryFocus = Color(0xff000862);
    this.accent = Color(0xff157500);
    this.accentFocus = Color(0xff044e05);
    this.contrast = Color(0xfffcfcfc);
    return this;
  }
}
