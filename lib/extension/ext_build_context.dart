import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_cubit.dart';

extension BuildContextExtension on BuildContext {
  /// 檢查是否為深色模式
  bool get isDarkMode =>
      read<SettingsCubit>().state.systemTheme.themeMode == ThemeMode.dark;
}
