import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/gen/assets.gen.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/models/system_theme.dart';
import 'package:flutter_bloc_dashboard/router.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_state.dart';
import 'package:flutter_bloc_dashboard/settings/profile_view.dart';
import 'package:flutter_bloc_dashboard/settings/setting_item.dart';
import 'package:flutter_bloc_dashboard/widgets/picker/bottom_sheet_picker.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileView(
                  name: 'John Doe',
                  email: 'john.doe@example.com',
                  profileImage: Assets.images.imgProfile.image(
                    width: 44,
                    height: 44,
                  ),
                ),
                SettingItem(
                  height: 60,
                  title: AppLocalizations.of(context)!.systemTheme,
                  icon: state.systemTheme.themeMode == ThemeMode.dark
                      ? Assets.icons.icDarkMode.svg(
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        )
                      : Assets.icons.icLightMode.svg(),
                  onTap: () => _showThemeModePicker(context),
                ),
                Divider(height: 1, color: Colors.grey.shade200),
                SettingItem(
                  height: 60,
                  title: AppLocalizations.of(context)!.systemLanguage,
                  icon: state.language.icon,
                  onTap: () => _goLanguageScreen(context),
                ),
                Divider(height: 1, color: Colors.grey.shade200),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 顯示主題模式選擇器
  Future<void> _showThemeModePicker(BuildContext context) async {
    final SystemTheme currentTheme = context.read<SettingsCubit>().state.systemTheme;
    final List<SystemTheme> supportedThemes = SystemTheme.supportedThemes(context);
    final SystemTheme? selectedTheme = await showModalBottomSheet<SystemTheme?>(
      context: context,
      builder: (context) => BottomSheetPicker(
        items: supportedThemes,
        selectedItem: currentTheme,
      ),
    );
    if (context.mounted && selectedTheme != null) {
      context.read<SettingsCubit>().setSystemTheme(selectedTheme);
    }
  }

  /// 前往語言設定畫面
  void _goLanguageScreen(BuildContext context) {
    context.push(Routes.language);
  }
}
