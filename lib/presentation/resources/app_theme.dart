import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

sealed class AppTheme {
  const AppTheme._();

  static ThemeData fromBrightness(Brightness brightness) {
    final _appColors = AppColors.fromBrightness(brightness);
    final _appTextStyles = AppTextStyles.fromBrightness(brightness);

    // TODO: Setup & map the theme colors and once done remove this TODO

    final _lightColorScheme = ColorScheme.light(
      brightness: brightness,
      primary: _appColors.primary,
      onPrimary: _appColors.foregroundOnPrimary,
      background: _appColors.primary,
      secondary: _appColors.secondary,
      onSecondary: _appColors.foregroundOnSecondary,
      onBackground: _appColors.foregroundOnBackground,
      outline: _appColors.outline,
      error: _appColors.danger,
      onError: _appColors.foregroundOnDanger,
    );

    final _darkColorScheme = ColorScheme.dark(
      brightness: brightness,
      primary: _appColors.primary,
      onPrimary: _appColors.foregroundOnPrimary,
      secondary: _appColors.secondary,
      onSecondary: _appColors.foregroundOnSecondary,
      background: _appColors.background,
      onBackground: _appColors.foregroundOnBackground,
      outline: _appColors.outline,
      error: _appColors.danger,
      onError: _appColors.foregroundOnDanger,
    );

    final _appColorScheme = switch (brightness) {
      Brightness.light => _lightColorScheme,
      Brightness.dark => _darkColorScheme,
    };

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: _appColors.background,
      splashFactory: InkRipple.splashFactory,
      fontFamily: AppFonts.activeFontFamily,
      colorScheme: _appColorScheme,
      highlightColor: Colors.transparent,
      splashColor: _appColors.splashColor,
      disabledColor: _appColors.primary.withOpacity(0.5),
      appBarTheme: AppBarTheme(
        color: _appColors.appBarBackground,
        foregroundColor: _appColors.foregroundOnAppBar,
      ),
      extensions: [
        _appColors,
        _appTextStyles,
      ],
    );
  }
}
