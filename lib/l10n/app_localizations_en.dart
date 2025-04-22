// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flutter Dashboard App';

  @override
  String get homeBarItem => 'Home';

  @override
  String get analysisBarItem => 'Analysis';

  @override
  String get settingsBarItem => 'Settings';

  @override
  String get filter => 'Filter';

  @override
  String get sort => 'Sort';

  @override
  String get all => 'All';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get selectOption => 'Select Option';

  @override
  String get systemLanguage => 'System Language';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get defaultTheme => 'Default Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get homeScreenTitle => 'Home Page';

  @override
  String get languageScreenTitle => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get chinese => 'Chinese';

  @override
  String get chineseTraditional => 'Chinese (Traditional)';

  @override
  String totalCleanRoom(Object count) {
    return 'Total Clean Room: $count rooms';
  }

  @override
  String get cleanStatusDirty => 'Dirty';

  @override
  String get cleanStatusCleaning => 'Cleaning';

  @override
  String get cleanStatusFinished => 'Finished';

  @override
  String get taskProgress => 'Task Progress';

  @override
  String get startCleaning => 'Start Cleaning';

  @override
  String get viewTask => 'View Task';

  @override
  String get sortCleanStatusAsc => 'Clean Status Ascending';

  @override
  String get sortCleanStatusDesc => 'Clean Status Descending';

  @override
  String get sortHotelNameAsc => 'Hotel Name Ascending';

  @override
  String get sortHotelNameDesc => 'Hotel Name Descending';

  @override
  String get sortProgressAsc => 'Task Progress Ascending';

  @override
  String get sortProgressDesc => 'Task Progress Descending';
}
