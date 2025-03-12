import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    required this.title,
    this.height = 44,
    this.icon,
    this.onTap,

    super.key,
  });

  /// 文字
  final String title;

  /// 高度
  final double height;

  /// 圖示
  final Widget? icon;

  /// 點擊事件
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: height,
        child: Row(
          children: [
            Expanded(child: Text(title)),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: icon!,
              ),
            const Icon(Icons.chevron_right, size: 32),
          ],
        ),
      ),
    );
  }
}
