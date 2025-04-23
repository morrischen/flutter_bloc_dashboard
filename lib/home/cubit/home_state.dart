import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dashboard/models/enum_set.dart';
import 'package:flutter_bloc_dashboard/models/hotel_task.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.hotelTasks,
    this.hotelTasksFiltered = const <HotelTask>[],
    this.selectedCleanStatus = CleanStatus.all,
    this.selectedSort = Sort.hotelNameASC,
    this.isLoading = false,
  });

  factory HomeState.initial() {
    return const HomeState(
      hotelTasks: <HotelTask>[],
    );
  }

  /// 飯店清潔任務列表
  final List<HotelTask> hotelTasks;

  /// 過濾的飯店清潔任務列表
  final List<HotelTask> hotelTasksFiltered;

  /// 目前清潔狀態
  final CleanStatus selectedCleanStatus;

  /// 目前排序方式
  final Sort selectedSort;

  /// 是否正在載入
  final bool isLoading;

  /// copyWith
  HomeState copyWith({
    List<HotelTask>? hotelTasks,
    List<HotelTask>? hotelTasksFiltered,
    CleanStatus? selectedCleanStatus,
    Sort? selectedSort,
    bool? isLoading,
  }) {
    return HomeState(
      hotelTasks: hotelTasks ?? this.hotelTasks,
      hotelTasksFiltered: hotelTasksFiltered ?? this.hotelTasksFiltered,
      selectedCleanStatus: selectedCleanStatus ?? this.selectedCleanStatus,
      selectedSort: selectedSort ?? this.selectedSort,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'HomeState{hotelTasks: $hotelTasks, hotelTasksFiltered: $hotelTasksFiltered, '
        'selectedCleanStatus: $selectedCleanStatus, selectedSort: $selectedSort, '
        'isLoading: $isLoading}';
  }

  @override
  List<Object?> get props => [
        hotelTasks,
        hotelTasksFiltered,
        selectedCleanStatus,
        selectedSort,
        isLoading,
      ];
}
