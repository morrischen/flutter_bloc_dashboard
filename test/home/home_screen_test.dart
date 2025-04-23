import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/home/cubit/home_state.dart';
import 'package:flutter_bloc_dashboard/models/language.dart';
import 'package:flutter_bloc_dashboard/models/system_theme.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_state.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_dashboard/home/home_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_dashboard/home/cubit/home_cubit.dart';

import '../main_test.dart';

// 建立 MockHomeCubit
class MockHomeCubit extends Mock implements HomeCubit {}

void main() {
  group('HomeScreen Tests', () {
    late MockHomeCubit mockHomeCubit;

    setUp(() {
      // 設定 MockHomeCubit 的初始狀態
      mockHomeCubit = MockHomeCubit();
      final initialHomeState = HomeState.initial();

      when(() => mockHomeCubit.state).thenReturn(initialHomeState);
      when(() => mockHomeCubit.stream)
          .thenAnswer((_) => Stream.value(initialHomeState));

      // 模擬 close 方法
      when(() => mockHomeCubit.close()).thenAnswer((_) async {});
    });

    tearDown(() {
      mockHomeCubit.close();
    });

    testWidgets('renders HomeScreen with user info and hotel list',
        (WidgetTester tester) async {
      await tester.pumpRouteWidget(
        screen: const HomeScreen(),
        blocProviders: [
          BlocProvider<HomeCubit>.value(value: mockHomeCubit),
        ],
      );

      // Assert: Verify the HomeScreen renders correctly
      expect(find.byType(HomeScreen), findsOneWidget);

      // Assert: Check if the user info section is displayed
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

      // Assert: Check if the hotel list is displayed
      expect(find.byType(ListView), findsOneWidget);
      expect(find.textContaining('Hotel 1'), findsWidgets);

      // Assert: Check if the search bar is displayed
      expect(find.text('Filter'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('變更語系', (WidgetTester tester) async {
      // 設定 MockSettingsState 的初始狀態
      final mockSettingsState = SettingsState.initial().copyWith(
        language: Language(
          value: Locale(
            LanguageCode.zh.getValue(),
            CountryCode.TW.getValue(),
          ),
          name: '繁體中文',
          icon: Language.getIcon(CountryCode.TW),
        ),
      );

      await tester.pumpRouteWidget(
        mockSettingsState: mockSettingsState,
        screen: const HomeScreen(),
        blocProviders: [
          BlocProvider<HomeCubit>.value(value: mockHomeCubit),
        ],
      );

      // Assert: Verify the HomeScreen renders correctly with the new language
      expect(find.text('篩選'), findsOneWidget);
      expect(find.text('排序'), findsOneWidget);
      expect(find.text('待清潔'), findsWidgets);
      expect(find.text('清潔中'), findsWidgets);
      expect(find.text('已完成'), findsWidgets);
    });

    testWidgets('renders dark mode background color',
        (WidgetTester tester) async {
      // 設定 MockSettingsState 的初始狀態
      final mockSettingsState = SettingsState.initial().copyWith(
        systemTheme: const SystemTheme(
          name: 'Dark',
          themeMode: ThemeMode.dark,
        ),
      );

      await tester.pumpRouteWidget(
        mockSettingsState: mockSettingsState,
        screen: const HomeScreen(),
        blocProviders: [
          BlocProvider<HomeCubit>.value(value: mockHomeCubit),
        ],
      );

      // Assert: Check if the background color is correct for dark mode
      final Container backgroundContainer = tester
          .widget(find.byKey(const Key('home_screen_background_container')));
      expect(backgroundContainer.color, AppColors.darkBackground);
    });

    testWidgets('renders light mode background color',
        (WidgetTester tester) async {
      // 設定 MockSettingsState 的初始狀態
      final mockSettingsState = SettingsState.initial().copyWith(
        systemTheme: const SystemTheme(
          name: 'Light',
          themeMode: ThemeMode.light,
        ),
      );

      await tester.pumpRouteWidget(
        mockSettingsState: mockSettingsState,
        screen: const HomeScreen(),
        blocProviders: [
          BlocProvider<HomeCubit>.value(value: mockHomeCubit),
        ],
      );

      // Assert: Check if the background color is correct for light mode
      final Container backgroundContainer = tester
          .widget(find.byKey(const Key('home_screen_background_container')));
      expect(backgroundContainer.color, AppColors.lightBackground);
    });
  });
}
