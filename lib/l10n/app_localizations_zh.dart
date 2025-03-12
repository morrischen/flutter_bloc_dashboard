// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Flutter 仪表板应用';

  @override
  String get homeBarItem => '首页';

  @override
  String get analysisBarItem => '分析';

  @override
  String get settingsBarItem => '设置';

  @override
  String get confirm => '确定';

  @override
  String get cancel => '取消';

  @override
  String get selectOption => '选择选项';

  @override
  String get systemLanguage => '系统语言';

  @override
  String get systemTheme => '系统主题';

  @override
  String get defaultTheme => '默认主题';

  @override
  String get lightTheme => '浅色主题';

  @override
  String get darkTheme => '深色主题';

  @override
  String get homeScreenTitle => '首页';

  @override
  String get languageScreenTitle => '选择语言';

  @override
  String get english => '英文';

  @override
  String get chinese => '中文';

  @override
  String get chineseTraditional => '繁体中文';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw(): super('zh_TW');

  @override
  String get appName => 'Flutter 儀表板應用';

  @override
  String get homeBarItem => '首頁';

  @override
  String get analysisBarItem => '分析';

  @override
  String get settingsBarItem => '設定';

  @override
  String get confirm => '確定';

  @override
  String get cancel => '取消';

  @override
  String get selectOption => '選擇選項';

  @override
  String get systemLanguage => '系統語言';

  @override
  String get systemTheme => '系統主題';

  @override
  String get defaultTheme => '預設主題';

  @override
  String get lightTheme => '淺色主題';

  @override
  String get darkTheme => '深色主題';

  @override
  String get homeScreenTitle => '首頁';

  @override
  String get languageScreenTitle => '選擇語言';

  @override
  String get english => '英文';

  @override
  String get chinese => '中文';

  @override
  String get chineseTraditional => '繁體中文';
}
