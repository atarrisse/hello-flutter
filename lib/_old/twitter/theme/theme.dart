import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData buildTheme() {
    const blueDark = Color.fromRGBO(0, 0, 68, 1.0);
    const blueLight = Color.fromRGBO(129, 204, 204, 1.0);
    const greyDark = Color.fromRGBO(102, 102, 102, 1.0);
    const grey = Color.fromRGBO(230, 230, 230, 1.0);

    final ThemeData base = ThemeData();
    return base.copyWith(
      accentColor: blueDark,
      buttonColor: Color(0XFFF8D320),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: blueLight)),
        hintStyle: TextStyle(color: greyDark),
        labelStyle: TextStyle(color: greyDark),
        focusColor: greyDark,
      ),
      primaryColor: blueLight,
      scaffoldBackgroundColor: grey,
    );
  }
}
