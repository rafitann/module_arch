import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final pinkTheme = ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.pink),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(30))),
      primaryColor: Colors.pinkAccent,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.pinkAccent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.pinkAccent,
      ));

  static final purpleTheme = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purpleAccent),
            borderRadius: BorderRadius.circular(30))),
    primaryColor: Colors.purpleAccent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.purpleAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.purpleAccent,
    ),
  );
  static final blueTheme = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(30))),
    primaryColor: Colors.blueAccent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
    ),
  );
}
