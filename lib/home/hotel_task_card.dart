import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/main.dart';
import 'package:flutter_bloc_dashboard/models/enum_status.dart';
import 'package:flutter_bloc_dashboard/models/hotel_task.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';
import 'package:flutter_bloc_dashboard/widgets/app_spacing.dart';

class HotelTaskCard extends StatelessWidget {
  const HotelTaskCard({
    required this.hotelTask,
    super.key,
  });

  /// 飯店任務
  final HotelTask hotelTask;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode;
    return Card(
      color: isDark ? AppColors.cardBackgroundDark : null,
      margin: AppSpacing.only(bottom: Spacing.md),
      elevation: 2,
      child: Padding(
        padding: AppSpacing.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelTask.hotelName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  padding: AppSpacing.symmetric(
                    horizontal: Spacing.sm,
                    vertical: Spacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.statusBlue.withValues(alpha: 0.2)
                        : AppColors.statusBlueLight,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.statusBlue),
                  ),
                  child: Text(
                    hotelTask.cleanStatus.toLocaleString(context),
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.height(Spacing.md),
            Row(
              children: [
                _buildStatusIndicator(
                  context,
                  AppLocalizations.of(context)!.cleanStatusDirty,
                  '${hotelTask.dirtyTask}',
                  AppColors.statusRedLight,
                  AppColors.textRed,
                ),
                AppSpacing.width(Spacing.md),
                _buildStatusIndicator(
                  context,
                  AppLocalizations.of(context)!.cleanStatusCleaning,
                  '${hotelTask.cleaningTask}',
                  AppColors.statusYellowLight,
                  AppColors.textYellow,
                ),
                AppSpacing.width(Spacing.md),
                _buildStatusIndicator(
                  context,
                  AppLocalizations.of(context)!.cleanStatusFinished,
                  '${hotelTask.finishTask}',
                  AppColors.statusGreenLight,
                  AppColors.textGreen,
                ),
              ],
            ),
            AppSpacing.height(Spacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.taskProgress,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    AppSpacing.height(Spacing.xs),
                    Text(
                      hotelTask.progressPercent,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: context.isDarkMode
                                ? AppColors.textYellowDark
                                : AppColors.textBlue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                // 如果為待清潔或清潔中狀態，顯示開始清潔按鈕
                if (hotelTask.cleanStatus == CleanStatus.dirty ||
                    hotelTask.cleanStatus == CleanStatus.cleaning)
                  _buildButton(
                    context,
                    AppLocalizations.of(context)!.startCleaning,
                    const Icon(Icons.cleaning_services),
                    context.isDarkMode
                        ? AppColors.buttonPrimary
                        : AppColors.buttonPrimaryLight,
                    () {
                      kLogger.d(
                        '${AppLocalizations.of(context)!.startCleaning} ${hotelTask.hotelName}',
                      );
                    },
                  ),
                // 如果為已完成狀態，顯示檢視任務
                if (hotelTask.cleanStatus == CleanStatus.finished)
                  _buildButton(
                    context,
                    AppLocalizations.of(context)!.viewTask,
                    const Icon(Icons.report),
                    context.isDarkMode
                        ? AppColors.buttonBackgroundDark
                        : AppColors.buttonPrimary,
                    () {
                      kLogger.d(
                        '${AppLocalizations.of(context)!.viewTask} ${hotelTask.hotelName}',
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 按鈕
  /// [context] BuildContext
  /// [label] 按鈕文字
  /// [icon] 按鈕圖示
  /// [backgroundColor] 按鈕背景顏色
  /// [onPressed] 按鈕點擊事件
  Widget _buildButton(
    BuildContext context,
    String label,
    Icon icon,
    Color backgroundColor,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.buttonOnPrimary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  /// 狀態指示器
  /// [context] BuildContext
  /// [label] 狀態名稱
  /// [count] 狀態數量
  /// [bgColor] 背景顏色
  /// [textColor] 文字顏色
  Widget _buildStatusIndicator(
    BuildContext context,
    String label,
    String count,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: AppSpacing.symmetric(
        horizontal: Spacing.sm,
        vertical: Spacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
            ),
          ),
          AppSpacing.height(Spacing.xs),
          Text(
            count,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
