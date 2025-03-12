import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';

class SystemTheme extends Equatable {
  const SystemTheme({required this.name, required this.themeMode});

  /// 主題名稱
  final String name;

  /// 主題模式
  final ThemeMode themeMode;

  /// 支持的主題模式
  static List<SystemTheme> supportedThemes(BuildContext context) {
    return [
      SystemTheme(
        name: AppLocalizations.of(context)!.defaultTheme,
        themeMode: ThemeMode.system,
      ),
      SystemTheme(
        name: AppLocalizations.of(context)!.lightTheme,
        themeMode: ThemeMode.light,
      ),
      SystemTheme(
        name: AppLocalizations.of(context)!.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'themeMode': themeMode.index,
    };
  }

  factory SystemTheme.fromJson(Map<String, dynamic> json) {
    return SystemTheme(
      name: json['name'],
      themeMode: ThemeMode.values[json['themeMode'] as int],
    );
  }

  @override
  String toString() {
    return name;
  }

  @override
  List<Object?> get props => [name, themeMode];
}
