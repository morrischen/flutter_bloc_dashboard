import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.seedColor,
      ),
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade200),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.seedColor,
      ),
    );
  }
}