import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'TW')
  ];

  /// Flutter 儀表板應用
  ///
  /// In en, this message translates to:
  /// **'Flutter Dashboard App'**
  String get appName;

  /// 首頁
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeBarItem;

  /// 分析
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysisBarItem;

  /// 設定
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsBarItem;

  /// 全部
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// 確定
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// 取消
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// 選擇選項
  ///
  /// In en, this message translates to:
  /// **'Select Option'**
  String get selectOption;

  /// 系統語言
  ///
  /// In en, this message translates to:
  /// **'System Language'**
  String get systemLanguage;

  /// 系統主題
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get systemTheme;

  /// 預設主題
  ///
  /// In en, this message translates to:
  /// **'Default Theme'**
  String get defaultTheme;

  /// 淺色主題
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightTheme;

  /// 深色主題
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// 首頁
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get homeScreenTitle;

  /// 選擇語言
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languageScreenTitle;

  /// 英文
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// 中文
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// 繁體中文
  ///
  /// In en, this message translates to:
  /// **'Chinese (Traditional)'**
  String get chineseTraditional;

  /// 待清潔房間數量count間
  ///
  /// In en, this message translates to:
  /// **'Total Clean Room: {count} rooms'**
  String totalCleanRoom(Object count);

  /// 待清潔
  ///
  /// In en, this message translates to:
  /// **'Dirty'**
  String get cleanStatusDirty;

  /// 清潔中
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get cleanStatusCleaning;

  /// 已完成
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get cleanStatusFinished;

  /// 任務進度
  ///
  /// In en, this message translates to:
  /// **'Task Progress'**
  String get taskProgress;

  /// 開始清潔
  ///
  /// In en, this message translates to:
  /// **'Start Cleaning'**
  String get startCleaning;

  /// 檢視任務
  ///
  /// In en, this message translates to:
  /// **'View Task'**
  String get viewTask;

  /// 清潔狀態升冪排序
  ///
  /// In en, this message translates to:
  /// **'Clean Status Ascending'**
  String get sortCleanStatusAsc;

  /// 清潔狀態降冪排序
  ///
  /// In en, this message translates to:
  /// **'Clean Status Descending'**
  String get sortCleanStatusDesc;

  /// 飯店名稱升冪排序
  ///
  /// In en, this message translates to:
  /// **'Hotel Name Ascending'**
  String get sortHotelNameAsc;

  /// 飯店名稱降冪排序
  ///
  /// In en, this message translates to:
  /// **'Hotel Name Descending'**
  String get sortHotelNameDesc;

  /// 任務進度升冪排序
  ///
  /// In en, this message translates to:
  /// **'Task Progress Ascending'**
  String get sortProgressAsc;

  /// 任務進度降冪排序
  ///
  /// In en, this message translates to:
  /// **'Task Progress Descending'**
  String get sortProgressDesc;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'TW': return AppLocalizationsZhTw();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
