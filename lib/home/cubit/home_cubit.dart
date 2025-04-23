import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/home/cubit/home_state.dart';
import 'package:flutter_bloc_dashboard/models/enum_set.dart';
import 'package:flutter_bloc_dashboard/models/hotel_task.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  /// 初始化
  void initialze() {
    final Random random = Random();
    final List<HotelTask> hotelTasks = List.generate(
      5 + random.nextInt(10),
      (index) => HotelTask(
        hotelName: 'Hotel ${index + 1}',
        dirtyTask: random.nextInt(10),
        cleaningTask: random.nextInt(10),
        finishTask: random.nextInt(10),
        cleanStatus: CleanStatus
            .values[1 + random.nextInt(CleanStatus.values.length - 1)],
        progress: random.nextDouble(),
      ),
    );
    emit(
      state.copyWith(hotelTasks: hotelTasks, hotelTasksFiltered: hotelTasks),
    );
  }

  /// 設定飯店清潔任務列表
  void setHotelTasks(List<HotelTask> hotelTasks) {
    emit(state.copyWith(hotelTasks: hotelTasks));
  }

  /// 設定過濾的飯店清潔任務列表
  void setHotelTasksFiltered(List<HotelTask> hotelTasksFiltered) {
    emit(state.copyWith(hotelTasksFiltered: hotelTasksFiltered));
  }

  /// 設定目前清潔狀態
  void setSelectedCleanStatus(
    BuildContext context,
    CleanStatus selectedCleanStatus,
  ) {
    List<HotelTask> hotelTasksFiltered = selectedCleanStatus == CleanStatus.all
        ? state.hotelTasks
        : state.hotelTasks.where((hotelTask) {
            return hotelTask.cleanStatus == selectedCleanStatus;
          }).toList();
    // 重新選擇清潔狀態時，套用目前的排序方式
    hotelTasksFiltered = _sortHotelTasks(
      context,
      hotelTasksFiltered,
      state.selectedSort,
    );
    emit(
      state.copyWith(
        hotelTasksFiltered: hotelTasksFiltered,
        selectedCleanStatus: selectedCleanStatus,
      ),
    );
  }

  /// 設定目前排序方式
  void setSelectedSort(BuildContext context, Sort selectedSort) {
    final List<HotelTask> hotelTasksFiltered =
        _sortHotelTasks(context, state.hotelTasksFiltered, selectedSort);
    emit(
      state.copyWith(
        hotelTasksFiltered: hotelTasksFiltered,
        selectedSort: selectedSort,
      ),
    );
  }

  /// 設定是否正在載入
  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// 排序飯店清潔任務
  List<HotelTask> _sortHotelTasks(
    BuildContext context,
    List<HotelTask> hotelTasks,
    Sort selectedSort,
  ) {
    switch (selectedSort) {
      case Sort.cleanStatusASC:
        return hotelTasks
          ..sort(
            (a, b) => a.cleanStatus
                .toLocaleString(context)
                .compareTo(b.cleanStatus.toLocaleString(context)),
          );
      case Sort.cleanStatusDESC:
        return hotelTasks
          ..sort(
            (a, b) => b.cleanStatus
                .toLocaleString(context)
                .compareTo(a.cleanStatus.toLocaleString(context)),
          );
      case Sort.hotelNameASC:
        return hotelTasks..sort((a, b) => a.hotelName.compareTo(b.hotelName));
      case Sort.hotelNameDESC:
        return hotelTasks..sort((a, b) => b.hotelName.compareTo(a.hotelName));
      case Sort.progressASC:
        return hotelTasks..sort((a, b) => a.progress.compareTo(b.progress));
      case Sort.progressDESC:
        return hotelTasks..sort((a, b) => b.progress.compareTo(a.progress));
    }
  }
}
