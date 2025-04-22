import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/models/app_theme.dart';
import 'package:flutter_bloc_dashboard/router.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc_dashboard/settings/cubit/settings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/web.dart';
import 'package:path_provider/path_provider.dart';

final Logger kLogger = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            locale: state.language.value,
            theme: const AppTheme().getLightTheme(),
            darkTheme: const AppTheme().getDarkTheme(),
            themeMode: state.systemTheme.themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          );
        },
      ),
    );
  }
}
