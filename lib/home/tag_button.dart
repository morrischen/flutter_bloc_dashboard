import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    required this.text,
    required this.isSelected,
    this.height = 44,
    super.key,
  });

  /// 文字
  final String text;

  /// 是否選取
  final bool isSelected;

  /// 高度
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: getBackgroundColor(context),
        borderRadius: BorderRadius.circular(40),
      ),
      height: height,
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: getTextColor(context)),
      ),
    );
  }

  Color getTextColor(BuildContext context) {
    if (isSelected) {
      return Colors.black;
    } else {
      return context.isDarkMode ? Colors.white : Colors.black;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    if (isSelected) {
      return context.isDarkMode
          ? Colors.greenAccent.shade100.withValues(alpha: 0.9)
          : Colors.blue.shade100;
    } else {
      return context.isDarkMode
          ? Colors.grey.shade700.withValues(alpha: 0.4)
          : Colors.grey.shade200;
    }
  }
}
