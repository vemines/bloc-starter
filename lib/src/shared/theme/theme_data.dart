import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/colors.gen.dart';
import 'theme_extension.dart';

/// Class that contains all the different styles of an app
class AppThemeData {
  /// Custom page transitions
  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Yellow style
  static ThemeData get experimental {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorName.accentExperimental,
        secondary: ColorName.accentExperimental,
        onSecondary: Colors.white,
      ),
      primaryColor: ColorName.primaryExperimental,
      scaffoldBackgroundColor: ColorName.backgroundExperimental,
      dividerColor: ColorName.dividerLight,
      pageTransitionsTheme: _pageTransitionsTheme,
      extensions: <ThemeExtension>[lightExt],
    );
  }

  /// Yellow style
  static ThemeData get yellow {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorName.accentYellow,
        secondary: ColorName.accentYellow,
        onSecondary: Colors.white,
      ),
      primaryColor: ColorName.primaryYellow,
      scaffoldBackgroundColor: ColorName.backgroundYellow,
      dividerColor: ColorName.dividerLight,
      pageTransitionsTheme: _pageTransitionsTheme,
      extensions: <ThemeExtension>[yellowExt],
    );
  }

  /// Light style
  static ThemeData get light {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorName.accentLight,
        secondary: ColorName.accentLight,
        onSecondary: Colors.white,
      ),
      primaryColor: ColorName.primaryLight,
      scaffoldBackgroundColor: ColorName.backgroundLight,
      dividerColor: ColorName.dividerLight,
      pageTransitionsTheme: _pageTransitionsTheme,
      extensions: <ThemeExtension>[darkExt],
    );
  }

  /// Dark style
  static ThemeData get dark {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: ColorName.accentDark,
        secondary: ColorName.accentDark,
      ),
      primaryColor: ColorName.primaryDark,
      canvasColor: ColorName.canvasDark,
      scaffoldBackgroundColor: ColorName.backgroundDark,
      cardColor: ColorName.cardDark,
      dividerColor: ColorName.dividerDark,
      dialogBackgroundColor: ColorName.cardDark,
      pageTransitionsTheme: _pageTransitionsTheme,
      extensions: <ThemeExtension>[darkExt],
    );
  }
}
