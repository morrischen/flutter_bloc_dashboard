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
  String get filter => '筛选';

  @override
  String get sort => '排序';

  @override
  String get all => '全部';

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

  @override
  String totalCleanRoom(Object count) {
    return '待清洁房间数量: $count间';
  }

  @override
  String get cleanStatusDirty => '待清洁';

  @override
  String get cleanStatusCleaning => '清洁中';

  @override
  String get cleanStatusFinished => '已完成';

  @override
  String get taskProgress => '任务进度';

  @override
  String get startCleaning => '开始清洁';

  @override
  String get viewTask => '查看任务';

  @override
  String get sortCleanStatusAsc => '清洁状态升序排序';

  @override
  String get sortCleanStatusDesc => '清洁状态降序排序';

  @override
  String get sortHotelNameAsc => '酒店名称升序排序';

  @override
  String get sortHotelNameDesc => '酒店名称降序排序';

  @override
  String get sortProgressAsc => '任务进度升序排序';

  @override
  String get sortProgressDesc => '任务进度降序排序';
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
  String get filter => '篩選';

  @override
  String get sort => '排序';

  @override
  String get all => '全部';

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

  @override
  String totalCleanRoom(Object count) {
    return '待清潔房間數量: $count間';
  }

  @override
  String get cleanStatusDirty => '待清潔';

  @override
  String get cleanStatusCleaning => '清潔中';

  @override
  String get cleanStatusFinished => '已完成';

  @override
  String get taskProgress => '任務進度';

  @override
  String get startCleaning => '開始清潔';

  @override
  String get viewTask => '檢視任務';

  @override
  String get sortCleanStatusAsc => '清潔狀態升冪排序';

  @override
  String get sortCleanStatusDesc => '清潔狀態降冪排序';

  @override
  String get sortHotelNameAsc => '飯店名稱升冪排序';

  @override
  String get sortHotelNameDesc => '飯店名稱降冪排序';

  @override
  String get sortProgressAsc => '任務進度升冪排序';

  @override
  String get sortProgressDesc => '任務進度降冪排序';
}
