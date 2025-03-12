import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: context.isDarkMode ? Colors.teal : Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedIconTheme:
            context.isDarkMode
                ? const IconThemeData(color: Colors.teal)
                : const IconThemeData(color: Colors.blueAccent),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.homeBarItem,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics),
            label: AppLocalizations.of(context)!.analysisBarItem,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settingsBarItem,
          ),
        ],
        onTap: (index) => navigationShell.goBranch(index),
      ),
    );
  }
}
