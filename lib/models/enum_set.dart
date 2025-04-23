import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';

abstract class Localizable {
  String toLocaleString(BuildContext context);
}

enum CleanStatus implements Localizable {
  /// 全部
  all,

  /// 待清潔
  dirty,

  /// 清潔中
  cleaning,

  /// 已完成
  finished;

  static CleanStatus getStatus(BuildContext context, String status) {
    return CleanStatus.values.firstWhere(
      (cleanStatus) => cleanStatus.toLocaleString(context) == status,
      orElse: () => CleanStatus.dirty,
    );
  }

  @override
  String toLocaleString(BuildContext context) {
    switch (this) {
      case CleanStatus.all:
        return AppLocalizations.of(context)!.all;
      case CleanStatus.dirty:
        return AppLocalizations.of(context)!.cleanStatusDirty;
      case CleanStatus.cleaning:
        return AppLocalizations.of(context)!.cleanStatusCleaning;
      case CleanStatus.finished:
        return AppLocalizations.of(context)!.cleanStatusFinished;
    }
  }
}

enum Sort implements Localizable {
  /// 飯店名稱升冪排序
  hotelNameASC,

  /// 飯店名稱降冪排序
  hotelNameDESC,

  /// 清潔狀態升冪排序
  cleanStatusASC,

  /// 清潔狀態降冪排序
  cleanStatusDESC,

  /// 任務進度升冪排序
  progressASC,

  /// 任務進度降冪排序
  progressDESC;

  static Sort getSort(BuildContext context, String sort) {
    return Sort.values.firstWhere(
      (sortType) => sortType.toLocaleString(context) == sort,
      orElse: () => Sort.hotelNameASC,
    );
  }

  @override
  String toLocaleString(BuildContext context) {
    switch (this) {
      case Sort.hotelNameASC:
        return AppLocalizations.of(context)!.sortHotelNameAsc;
      case Sort.hotelNameDESC:
        return AppLocalizations.of(context)!.sortHotelNameDesc;
      case Sort.cleanStatusASC:
        return AppLocalizations.of(context)!.sortCleanStatusAsc;
      case Sort.cleanStatusDESC:
        return AppLocalizations.of(context)!.sortCleanStatusDesc;
      case Sort.progressASC:
        return AppLocalizations.of(context)!.sortProgressAsc;
      case Sort.progressDESC:
        return AppLocalizations.of(context)!.sortProgressDesc;
    }
  }
}
