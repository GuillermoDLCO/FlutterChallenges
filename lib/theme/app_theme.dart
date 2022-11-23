import 'package:flutter/material.dart';

enum AppTheme {
  normal,
  light,
  dark,
}

final appThemeData = {
  AppTheme.normal: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  AppTheme.light: ThemeData(
    fontFamily: 'Hybi11-Amigo',
    primaryColor: const Color(0xffffffff),
    backgroundColor: const Color(0xffF6F8FA),
    bottomAppBarColor: Colors.white,
    highlightColor: const Color(0xff1977F3),
    hoverColor: const Color(0xff2D3F7B),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xff444D6E)),
      bodyText2: TextStyle(color: Color(0xff8E97B7)),
      headline1: TextStyle(color: Color(0xff19295C)),
      headline6: TextStyle(color: Color(0xffBABDC9)),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xffF8F9FA),
      secondary: const Color(0xff2D3F7B),
    ),
  ),
  AppTheme.dark: ThemeData(
    fontFamily: 'Hybi11-Amigo',
    primaryColor: const Color(0xff232935),
    backgroundColor: const Color(0xff080E1D),
    bottomAppBarColor: const Color(0xff080E1D),
    highlightColor: Colors.white,
    hoverColor: const Color(0xff282E39),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Color(0xffBABDC9)),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff2A303B),
      secondary: Colors.white,
    ),
  ),
};
