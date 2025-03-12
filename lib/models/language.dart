import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/gen/assets.gen.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';

enum LanguageCode {
  en,
  zh;

  String getValue() {
    switch (this) {
      case LanguageCode.en:
        return 'en';
      case LanguageCode.zh:
        return 'zh';
    }
  }
}

enum CountryCode {
  // ignore: constant_identifier_names
  US,
  // ignore: constant_identifier_names
  CN,
  // ignore: constant_identifier_names
  TW;

  String getValue() {
    switch (this) {
      case CountryCode.US:
        return 'US';
      case CountryCode.CN:
        return 'CN';
      case CountryCode.TW:
        return 'TW';
    }
  }
}

class Language extends Equatable {
  const Language({required this.value, required this.name, this.icon});

  /// 語言
  final Locale value;

  /// 語言名稱
  final String name;

  /// 圖案
  final Widget? icon;

  /// 支援的語言
  static List<Language> supportedLanguages(BuildContext context) {
    return [
      // 英文
      Language(
        value: Locale(LanguageCode.en.getValue(), CountryCode.US.getValue()),
        name: AppLocalizations.of(context)!.english,
        icon: getIcon(CountryCode.US),
      ),
      // 簡體中文
      Language(
        value: Locale(LanguageCode.zh.getValue(), CountryCode.CN.getValue()),
        name: AppLocalizations.of(context)!.chinese,
        icon: getIcon(CountryCode.CN),
      ),
      // 繁體中文
      Language(
        value: Locale(LanguageCode.zh.getValue(), CountryCode.TW.getValue()),
        name: AppLocalizations.of(context)!.chineseTraditional,
        icon: getIcon(CountryCode.TW),
      ),
    ];
  }

  /// 取得圖案
  static Widget? getIcon(CountryCode countryCode) {
    switch (countryCode) {
      case CountryCode.US:
        return Assets.icons.icEn.svg(width: 24, height: 24);
      case CountryCode.CN:
        return Assets.icons.icZh.svg(width: 24, height: 24);
      case CountryCode.TW:
        return Assets.icons.icZhTw.svg(width: 24, height: 24);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': value.languageCode,
      'countryCode': value.countryCode,
      'name': name,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    final CountryCode countryCode = CountryCode.values.firstWhere(
      (e) => e.getValue() == json['countryCode'],
      // 預設值
      orElse: () => CountryCode.US,
    );
    return Language(
      value: Locale(json['languageCode'], json['countryCode']),
      name: json['name'],
      icon: getIcon(countryCode),
    );
  }

  @override
  String toString() {
    return 'Language{languageCode: ${value.languageCode}, countryCode: ${value.countryCode}, name: $name, icon: $icon}';
  }

  @override
  List<Object?> get props => [value];
}
