import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';

abstract class Localizable {
  String toLocaleString(BuildContext context);
}

enum CleanStatus implements Localizable {
  /// 待清潔
  dirty,

  /// 清潔中
  cleaning,

  /// 已完成
  finished;

  @override
  String toLocaleString(BuildContext context) {
    switch (this) {
      case CleanStatus.dirty:
        return AppLocalizations.of(context)!.cleanStatusDirty;
      case CleanStatus.cleaning:
        return AppLocalizations.of(context)!.cleanStatusCleaning;
      case CleanStatus.finished:
        return AppLocalizations.of(context)!.cleanStatusFinished;
    }
  }
}
