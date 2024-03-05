import 'src/bloc/locale/locale_cubit.dart';
import 'src/bloc/theme/theme_cubit.dart';
import 'src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/shared/constants/values.dart';
import 'gen/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocaleCubit _localeCubit = LocaleCubit();
  final ThemeCubit _themeCubit = ThemeCubit();

  @override
  void initState() {
    super.initState();
    _localeCubit.loadCurrentLocale();
    _themeCubit.loadCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _localeCubit),
        BlocProvider.value(value: _themeCubit),
      ],
      child: Builder(
        builder: (context) {
          final locale = context.watch<LocaleCubit>();
          final appTheme = context.watch<ThemeCubit>();

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
            routerConfig: AppPages.router,
            theme: themeData[appTheme.state],
            themeMode: {
              ThemeMode.dark: ThemeMode.dark,
              ThemeMode.system: ThemeMode.system,
              ThemeMode.light: ThemeMode.light,
            }[appTheme.themeMode],
            locale: locale.state,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: supportLanguages,
          );
        },
      ),
    );
  }
}
