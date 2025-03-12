import 'package:flutter_bloc_dashboard/models/language.dart';
import 'package:flutter_bloc_dashboard/models/system_theme.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void setSystemTheme(SystemTheme systemTheme) {
    emit(state.copyWith(systemTheme: systemTheme));
  }

  void setLanguage(Language language) {
    emit(state.copyWith(language: language));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return state.toJson();
  }
}
