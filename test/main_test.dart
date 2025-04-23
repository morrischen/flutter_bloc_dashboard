import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/main.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MockHydratedStorage extends Mock implements HydratedStorage {}

// 建立 MockSettingsCubit
class MockSettingsCubit extends Mock implements SettingsCubit {}

void main() {
  group('DashboardApp Tests', () {
    late MockSettingsCubit mockSettingsCubit;
    late HydratedStorage storage;

    setUp(() async {
      mockSettingsCubit = MockSettingsCubit();
      storage = MockHydratedStorage();

      // 初始化 HydratedBloc 的 storage
      HydratedBloc.storage = storage;

      // 設定 MockSettingsCubit 的初始狀態
      when(() => mockSettingsCubit.state).thenReturn(SettingsState.initial());
      when(() => mockSettingsCubit.stream)
          .thenAnswer((_) => Stream.value(SettingsState.initial()));
    });

    testWidgets('renders DashboardApp with SettingsCubit',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const DashboardApp(),
      );

      await tester.pumpAndSettle();

      // 驗證 MaterialApp 是否存在
      expect(find.byType(MaterialApp), findsOneWidget);

      // 驗證主題是否正確
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.theme, isNotNull);
      expect(app.darkTheme, isNotNull);
    });
  });
}

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpRouteWidget({
    required Widget screen,
    required List<BlocProvider> blocProviders,
    SettingsState? mockSettingsState,
  }) async {
    // 建立 MockSettingsCubit
    final mockSettingsCubit = MockSettingsCubit();
    final settingsState = mockSettingsState ?? SettingsState.initial();

    // 設定 MockSettingsCubit 的初始狀態和 stream
    when(() => mockSettingsCubit.state).thenReturn(settingsState);
    when(() => mockSettingsCubit.stream)
        .thenAnswer((_) => Stream.value(settingsState));

    await pumpWidget(
      BlocProvider<SettingsCubit>.value(
        value: mockSettingsCubit,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) => MaterialApp(
            themeMode: state.systemTheme.themeMode,
            locale: state.language.value,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: MultiBlocProvider(providers: blocProviders, child: screen),
          ),
        ),
      ),
    );
    await pumpAndSettle();
  }
}
