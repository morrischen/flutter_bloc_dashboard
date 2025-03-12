import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// 檢查是否為深色模式
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
} 