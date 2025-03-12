import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/models/language.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageScreenTitle),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final language = Language.supportedLanguages(context)[index];
          return ListTile(
            title: Text(language.name),
            trailing: _getTrailing(context, language),
            onTap: () => _onLanguageChanged(context, language),
          );
        },
        separatorBuilder:
            (context, index) => Divider(height: 1, color: Colors.grey.shade200),
        itemCount: Language.supportedLanguages(context).length,
      ),
    );
  }

  Widget? _getTrailing(BuildContext context, Language language) {
    final state = context.watch<SettingsCubit>().state;
    return state.language == language ? const Icon(Icons.check) : null;
  }

  /// 語言變更
  void _onLanguageChanged(BuildContext context, Language language) {
    context.read<SettingsCubit>().setLanguage(language);
    Navigator.of(context).pop();
  }
}
