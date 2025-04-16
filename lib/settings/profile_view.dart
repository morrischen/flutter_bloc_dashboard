import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    required this.name,
    required this.email,
    this.profileImage,
    super.key,
  });

  /// 使用者姓名
  final String name;

  /// 使用者電子郵件
  final String email;

  /// 使用者頭像
  final Widget? profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      color: context.isDarkMode
          ? AppColors.userInfoBackgroundDark
          : Colors.grey.shade200,
      child: Row(
        spacing: 12,
        children: [
          CircleAvatar(
            backgroundColor: context.isDarkMode
                ? AppColors.avatarBackgroundDark
                : AppColors.avatarBackgroundLight,
            radius: 50,
            child: profileImage,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleLarge),
              Text(email, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}
