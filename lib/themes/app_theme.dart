import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color primaryColor = const Color(0xFFFF0000);
  // E70D32
  static Color primaryColorDark = const Color(0xFFA7001C);
  static Color primaruOpacityColor = const Color.fromRGBO(231, 13, 50, 0.09);
  static Color backgroundColor = const Color(0xFFE4E4E4);
  static ThemeData appThemeLight = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)))),
    scaffoldBackgroundColor: backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColor, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColorDark, width: 1.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: primaruOpacityColor,
        filled: true,
        contentPadding: const EdgeInsets.all(15)),
  );
}
