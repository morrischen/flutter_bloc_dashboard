import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';
import 'package:flutter_bloc_dashboard/gen/assets.gen.dart';
import 'package:flutter_bloc_dashboard/home/hotel_task_card.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/models/enum_status.dart';
import 'package:flutter_bloc_dashboard/models/hotel_task.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';
import 'package:flutter_bloc_dashboard/widgets/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      body: SafeArea(
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
        children: [
          // 篩選按鈕
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('篩選'),
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
  final Random random = Random();
  return ListView.builder(
    padding: AppSpacing.all(Spacing.md),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 5,
    itemBuilder: (context, index) {
      return HotelTaskCard(
        hotelTask: HotelTask(
          hotelName: 'Hotel ${index + 1}',
          dirtyTask: random.nextInt(10),
          cleaningTask: random.nextInt(10),
          finishTask: random.nextInt(10),
          cleanStatus:
              CleanStatus.values[random.nextInt(CleanStatus.values.length)],
          progress: random.nextDouble(),
        ),
      );
    },
  );
}
