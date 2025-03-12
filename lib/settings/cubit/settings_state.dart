import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/models/language.dart';
import 'package:flutter_bloc_dashboard/models/system_theme.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.systemTheme, required this.language});

  factory SettingsState.initial() {
    return SettingsState(
      systemTheme: const SystemTheme(name: '', themeMode: ThemeMode.system),
      language: Language(
        value: Locale(LanguageCode.en.getValue(), CountryCode.US.getValue()),
        name: 'English',
        icon: Language.getIcon(CountryCode.US),
      ),
    );
  }

  final SystemTheme systemTheme;
  final Language language;

  /// copyWith
  SettingsState copyWith({SystemTheme? systemTheme, Language? language}) {
    return SettingsState(
      systemTheme: systemTheme ?? this.systemTheme,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toJson() {
    return {'systemTheme': systemTheme.toJson(), 'language': language.toJson()};
  }

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      systemTheme: SystemTheme.fromJson(json['systemTheme']),
      language: Language.fromJson(json['language']),
    );
  }

  @override
  String toString() {
    return 'SettingsState{systemTheme: $systemTheme, language: $language}';
  }

  @override
  List<Object?> get props => [systemTheme, language];
}
