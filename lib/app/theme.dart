import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    primaryColor: Colors.yellow[700],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow[700],
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.yellow[700],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow[700],
    ),
  );
}
