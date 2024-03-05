import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/enums.dart';
import '../../shared/helpers/hive_helper.dart';
import '../../shared/theme/theme_data.dart';

final Map<AppTheme, ThemeData> themeData = {
  AppTheme.system: AppThemeData.light,
  AppTheme.light: AppThemeData.light,
  AppTheme.dark: AppThemeData.dark,
  AppTheme.yellow: AppThemeData.yellow,
  AppTheme.experimental: AppThemeData.experimental,
};

final Map<AppTheme, String> supportsTheme = {
  AppTheme.system: "System",
  AppTheme.light: "Light",
  AppTheme.dark: "Dark",
  AppTheme.yellow: "Yellow",
  AppTheme.experimental: "Experimental",
};

/// Saves and loads information regarding the theme setting.
class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.dark);

  final String _themeKey = 'app-theme';

  HiveHelper hive = HiveHelper.instance;
  void loadCurrentTheme() {
    int? themeIndex = hive.get(key: _themeKey);
    if (themeIndex != null) {
      emit(AppTheme.values[themeIndex]);
    }
  }

  /// Returns appropriate theme mode
  ThemeMode get themeMode {
    switch (state) {
      case AppTheme.experimental:
      case AppTheme.light:
      case AppTheme.yellow:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Default theme
  ThemeData getDefaultTheme() {
    switch (state) {
      case AppTheme.light:
        return themeData[AppTheme.light] ?? AppThemeData.light;
      case AppTheme.dark:
        return themeData[AppTheme.dark] ?? AppThemeData.dark;
      case AppTheme.yellow:
        return themeData[AppTheme.yellow] ?? AppThemeData.light;
      case AppTheme.system:
        return themeData[AppTheme.system] ?? AppThemeData.light;
      case AppTheme.experimental:
        return themeData[AppTheme.experimental] ?? AppThemeData.light;
    }
  }

  /// Default dark theme
  ThemeData get darkTheme => themeData[AppTheme.dark] ?? AppThemeData.dark;

  void setTheme(AppTheme theme) {
    hive.put(key: _themeKey, value: theme.index);
    emit(theme);
  }
}
