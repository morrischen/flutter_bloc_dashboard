import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/widgets/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_dashboard/home/home_screen.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';

void main() {
  group('HomeScreen Tests', () {
    testWidgets('renders HomeScreen with user info and hotel list',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomeScreen(),
        ),
      );
      await tester.pumpAndSettle();
      // Assert: Verify the HomeScreen renders correctly
      expect(find.byType(HomeScreen), findsOneWidget);

      // Assert: Check if the user info section is displayed
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

      // Assert: Check if the hotel list is displayed
      expect(find.byType(ListView), findsOneWidget);
      expect(find.textContaining('Hotel 1'), findsWidgets);

      // Assert: Check if the search bar is displayed
      expect(find.text('篩選'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
    testWidgets('renders dark mode background color',
        (WidgetTester tester) async {
      // Arrange: Build the HomeScreen widget with dark mode
      await tester.pumpWidget(
         MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeScreen(),
          theme: ThemeData.dark(),
        ),
      );
      await tester.pumpAndSettle();

      // Assert: Check if the background color is correct for dark mode
      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      expect(scaffold.backgroundColor, AppColors.darkBackground);
    });

    testWidgets('renders light mode background color',
        (WidgetTester tester) async {
      // Arrange: Build the HomeScreen widget with light mode
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeScreen(),
          theme: ThemeData.light(),
        ),
      );
      await tester.pumpAndSettle();
      // Assert: Check if the background color is correct for light mode
      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      expect(scaffold.backgroundColor, AppColors.lightBackground);
    });
  });
}
