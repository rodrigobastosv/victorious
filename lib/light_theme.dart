import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.black,
  accentColor: Colors.yellow,
  colorScheme: ColorScheme(
    background: Colors.white,
    brightness: Brightness.light,
    error: Colors.red,
    onBackground: Colors.black,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    primary: Colors.yellow,
    primaryVariant: Colors.yellow[700],
    secondary: Colors.grey,
    secondaryVariant: Colors.grey[700],
    surface: Colors.grey[200],
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
      ),
      headline4: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.black,
    elevation: 0,
  ),
  cardTheme: CardTheme(
    elevation: 3,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(),
  ),
);
