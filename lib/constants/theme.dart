import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.red,
  /*appBarTheme: const AppBarTheme(
    backgroundColor: Colors.red,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),*/
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    disabledBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 18,
      ),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey),
);
