import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';
import 'package:flutter_bloc_dashboard/gen/assets.gen.dart';
import 'package:flutter_bloc_dashboard/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_dashboard/home/cubit/home_state.dart';
import 'package:flutter_bloc_dashboard/home/hotel_task_card.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/models/enum_set.dart';
import 'package:flutter_bloc_dashboard/models/hotel_task.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';
import 'package:flutter_bloc_dashboard/widgets/app_spacing.dart';
import 'package:flutter_bloc_dashboard/widgets/picker/bottom_sheet_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..initialze(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => SafeArea(
            child: Container(
              key: const Key('home_screen_background_container'),
              color: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: context.isDarkMode
                        ? AppColors.userInfoBackgroundDark
                        : Colors.grey.shade200,
                    expandedHeight: 76,
                    collapsedHeight: kToolbarHeight,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _buildUserInfo(context),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SearchBarDelegate(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildHotelListView(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 搜尋列
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  _SearchBarDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: context.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      padding: AppSpacing.symmetric(horizontal: Spacing.md),
      alignment: Alignment.centerLeft,
      child: Row(
        spacing: Spacing.md,
        children: [
          // 篩選按鈕
          ElevatedButton.icon(
            onPressed: () => _showCleanStatusPicker(context),
            icon: const Icon(Icons.search),
            label: Text(AppLocalizations.of(context)!.filter),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.isDarkMode
                  ? AppColors.buttonPrimary
                  : AppColors.buttonPrimaryLight,
              foregroundColor: AppColors.buttonOnPrimary,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => _showSortPicker(context),
            icon: const Icon(Icons.sort),
            label: Text(AppLocalizations.of(context)!.sort),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.isDarkMode
                  ? AppColors.buttonPrimary
                  : AppColors.buttonPrimaryLight,
              foregroundColor: AppColors.buttonOnPrimary,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  /// 顯示清潔狀態選擇器
  Future<void> _showCleanStatusPicker(BuildContext context) async {
    final CleanStatus currentCleanStatus =
        context.read<HomeCubit>().state.selectedCleanStatus;
    final List<String> cleanStatus =
        CleanStatus.values.map((e) => e.toLocaleString(context)).toList();
    final String? selectedCleanStatus = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => BottomSheetPicker<String>(
        items: cleanStatus,
        selectedItem: currentCleanStatus.toLocaleString(context),
      ),
    );
    if (context.mounted && selectedCleanStatus != null) {
      final CleanStatus status =
          CleanStatus.getStatus(context, selectedCleanStatus);
      context.read<HomeCubit>().setSelectedCleanStatus(context, status);
    }
  }

  /// 顯示排序方式選擇器
  Future<void> _showSortPicker(BuildContext context) async {
    final Sort currentSort = context.read<HomeCubit>().state.selectedSort;
    final List<String> sorts =
        Sort.values.map((e) => e.toLocaleString(context)).toList();
    final String? selectedSort = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => BottomSheetPicker<String>(
        items: sorts,
        selectedItem: currentSort.toLocaleString(context),
      ),
    );
    if (context.mounted && selectedSort != null) {
      final Sort sort = Sort.getSort(context, selectedSort);
      context.read<HomeCubit>().setSelectedSort(context, sort);
    }
  }
}

/// 使用者資訊
/// 顯示使用者頭像、姓名、清潔房間數量
Widget _buildUserInfo(BuildContext context) {
  return Container(
    padding: AppSpacing.all(Spacing.md),
    decoration: BoxDecoration(
      color: context.isDarkMode
          ? AppColors.userInfoBackgroundDark
          : Colors.grey.shade200,
      boxShadow: [
        BoxShadow(
          color: context.isDarkMode
              ? Colors.black.withValues(alpha: 0.2)
              : Colors.grey.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimary,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: context.isDarkMode
                ? AppColors.avatarBackgroundDark
                : AppColors.avatarBackgroundLight,
            child: Assets.images.imgProfile.image(
              width: 32,
              height: 32,
            ),
          ),
        ),
        AppSpacing.width(Spacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.isDarkMode
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              AppSpacing.height(Spacing.xs),
              Text(
                AppLocalizations.of(context)!
                    .totalCleanRoom(Random().nextInt(10)),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.isDarkMode
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// 顯示飯店清潔任務列表
Widget _buildHotelListView(BuildContext context) {
  final hotelTasksFiltered =
      context.watch<HomeCubit>().state.hotelTasksFiltered;
  return ListView.builder(
    padding: AppSpacing.all(Spacing.md),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: hotelTasksFiltered.length,
    itemBuilder: (context, index) {
      return HotelTaskCard(
        hotelTask: HotelTask(
          hotelName: hotelTasksFiltered[index].hotelName,
          dirtyTask: hotelTasksFiltered[index].dirtyTask,
          cleaningTask: hotelTasksFiltered[index].cleaningTask,
          finishTask: hotelTasksFiltered[index].finishTask,
          cleanStatus: hotelTasksFiltered[index].cleanStatus,
          progress: hotelTasksFiltered[index].progress,
        ),
      );
    },
  );
}
