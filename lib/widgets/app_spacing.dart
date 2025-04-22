import 'package:flutter/material.dart';

class Spacing {
  /// 4.0
  static const double xs = 4.0;

  /// 8.0
  static const double sm = 8.0;

  /// 16.0
  static const double md = 16.0;

  /// 24.0
  static const double lg = 24.0;

  /// 32.0
  static const double xl = 32.0;
}

class AppSpacing {
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }

  static EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return AppSpacing.only(left: left, top: top, right: right, bottom: bottom);
  }

  static EdgeInsets all(double spacing) {
    return AppSpacing.only(
      left: spacing,
      top: spacing,
      right: spacing,
      bottom: spacing,
    );
  }

  static EdgeInsets left(double spacing) {
    return AppSpacing.only(left: spacing);
  }

  static EdgeInsets exceptLeft(double spacing) {
    return AppSpacing.only(top: spacing, right: spacing, bottom: spacing);
  }

  static EdgeInsets top(double spacing) {
    return AppSpacing.only(top: spacing);
  }

  static EdgeInsets exceptTop(double spacing) {
    return AppSpacing.only(left: spacing, right: spacing, bottom: spacing);
  }

  static EdgeInsets right(double spacing) {
    return AppSpacing.only(right: spacing);
  }

  static EdgeInsets exceptRight(double spacing) {
    return AppSpacing.only(left: spacing, top: spacing, bottom: spacing);
  }

  static EdgeInsets bottom(double spacing) {
    return AppSpacing.only(bottom: spacing);
  }

  static EdgeInsets exceptBottom(double spacing) {
    return AppSpacing.only(left: spacing, top: spacing, right: spacing);
  }

  static EdgeInsets horizontal(double spacing) {
    return AppSpacing.only(left: spacing, right: spacing);
  }

  static EdgeInsets vertical(double spacing) {
    return AppSpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsets verticalHorizontal(double vSpacing, double hSpacing) {
    return AppSpacing.only(
      left: hSpacing,
      top: vSpacing,
      right: hSpacing,
      bottom: vSpacing,
    );
  }

  static EdgeInsets symmetric({double vertical = 0, double horizontal = 0}) {
    return AppSpacing.only(
      left: horizontal,
      top: vertical,
      right: horizontal,
      bottom: vertical,
    );
  }

  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  static SizedBox width(double width) {
    return SizedBox(width: width);
  }

  static Widget empty() {
    return const SizedBox(width: 0, height: 0);
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double safeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
