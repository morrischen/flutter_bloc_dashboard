import 'package:flutter_bloc_dashboard/models/enum_set.dart';

class HotelTask {
  HotelTask({
    required this.hotelName,
    required this.cleanStatus,
    required this.dirtyTask,
    required this.cleaningTask,
    required this.finishTask,
    required this.progress,
  });

  /// 飯店名稱
  final String hotelName;

  /// 清潔狀態
  final CleanStatus cleanStatus;

  /// 待清潔任務數
  final int dirtyTask;

  /// 清潔中任務數
  final int cleaningTask;

  /// 已完成任務數
  final int finishTask;

  /// 進度
  final double progress;

  /// 進度百分比
  String get progressPercent {
    return '${(progress * 100).toStringAsFixed(0)}%';
  }

  @override
  String toString() {
    return 'HotelTask{hotelName: $hotelName, cleanStatus: $cleanStatus, '
        'dirtyTask: $dirtyTask, cleaningTask: $cleaningTask, '
        'finishTask: $finishTask, progress: $progress}';
  }
}
