import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.black,
      ),
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade200),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
      ),
    );
  }
}