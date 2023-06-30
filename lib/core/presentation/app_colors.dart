import 'package:flutter/material.dart';

abstract class AppColors {
  static const white = Colors.white;
  static const gray1 = Color(0xFF8799A5);
  static const red = Colors.red;
  static const black = Colors.black;

  static const MaterialColor appColor =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE1E0FF),
    100: Color(0xFFB5B3FF),
    200: Color(0xFF8380FF),
    300: Color(0xFF514DFF),
    400: Color(0xFF2C26FF),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF0600FF),
    700: Color(0xFF0500FF),
    800: Color(0xFF0400FF),
    900: Color(0xFF0200FF),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF0700FF;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFBFBFFF),
    700: Color(0xFFA6A6FF),
  });
  static const int _mcgpalette0AccentValue = 0xFFF2F2FF;
}
