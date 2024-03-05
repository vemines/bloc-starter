// Contain colors your want define or can't put in ColorScheme
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';

abstract class ColorThemeExt {
  Color get warning;
  // don't use setter it looping
  setWarning(Color value) => warning == value;
  Color get success;
  setSuccess(Color value) => success == value;
  Color get info;
  setInfo(Color value) => info == value;
}

// Named by theme, here is demo 3 extension light/dart/yellow, each can reuse able
class LightColorThemeExt extends ColorThemeExt {
  @override
  Color get warning => ColorName.lightWarning;
  @override
  Color get success => ColorName.lightSuccess;
  @override
  Color get info => ColorName.lightInfo;
}

class DarkColorThemeExt extends ColorThemeExt {
  @override
  Color get warning => ColorName.darkWarning;
  @override
  Color get success => ColorName.darkSuccess;
  @override
  Color get info => ColorName.darkInfo;
}

// yellow theme extension
class YellowThemeExt extends ColorThemeExt {
  @override
  Color get warning => Colors.purpleAccent;
  @override
  Color get success => Colors.blueAccent;
  @override
  Color get info => Colors.yellowAccent;
}

class CustomColors extends ThemeExtension<CustomColors> {
  late ColorThemeExt colorTheme;
  CustomColors({required this.colorTheme});

  @override
  ThemeExtension<CustomColors> copyWith({ColorThemeExt? colorTheme}) {
    return CustomColors(colorTheme: colorTheme ?? this.colorTheme);
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    // check instance
    if (other is! CustomColors) return this;

    colorTheme.setWarning(lerpColor(colorTheme.warning, other.colorTheme.warning, t));
    colorTheme.setSuccess(lerpColor(colorTheme.success, other.colorTheme.success, t));
    colorTheme.setInfo(lerpColor(colorTheme.info, other.colorTheme.info, t));

    return this;
  }
}

CustomColors lightExt = CustomColors(colorTheme: LightColorThemeExt());
CustomColors darkExt = CustomColors(colorTheme: DarkColorThemeExt());
CustomColors yellowExt = CustomColors(colorTheme: YellowThemeExt());

Color lerpColor(Color a, Color b, double t) => Color.lerp(a, b, t) ?? a;
