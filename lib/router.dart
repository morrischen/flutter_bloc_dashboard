import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/bottom_navi_bar/app_bottom_navi_bar.dart';
import 'package:flutter_bloc_dashboard/home/home_screen.dart';
import 'package:flutter_bloc_dashboard/languages/language_screen.dart';
import 'package:flutter_bloc_dashboard/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String home = '/home';
  static const String analysis = '/analysis';
  static const String settings = '/settings';
  static const String language = '/language';
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              AppBottomNavigationBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.analysis,
              builder:
                  (context, state) =>
                      Container(child: Center(child: Text('Analysis'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: Routes.language,
              builder: (context, state) => const LanguageScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
