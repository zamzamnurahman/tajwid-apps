import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff005CB2);
const Color primaryLightColor = Color(0xff9BE7FF);
const Color primaryDark = Color(0xff2286C3);
const Color secondaryColor = Color(0xff1E88E5);
const Color secondaryLightColor = Color(0xff6AB7FF);
const Color secodaryDarkColor = Color(0xff005CB2);

Gradient linearGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColor,
      secondaryLightColor,
    ]);
Gradient linearGradientLight = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColor,
      Colors.white,
    ]);
Gradient linearGradientDark = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDark,
      secodaryDarkColor,
    ]);

ThemeData themeData = ThemeData(
  primaryColor: primaryColor,
  fontFamily: "Poppins",
);
