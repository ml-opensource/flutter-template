import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_color_palette.dart';

class AppColors extends ThemeExtension<AppColors> {
  static Color get black => AppColorPalette.black;
  static Color get white => AppColorPalette.white;

  const AppColors({
    required this.primary,
    required this.primaryVarient,
    required this.secondary,
    required this.secondaryVarient,
    required this.background,
    required this.appBarBackground,
    required this.danger,
    required this.foregroundOnBackground,
    required this.foregroundLightOnBackground,
    required this.foregroundOnPrimary,
    required this.foregroundOnSecondary,
    required this.foregroundOnAppBar,
    required this.foregroundOnDanger,
    required this.outline,
    required this.splashColor,
    required this.disabledColor,
    required this.transparant,
  });

  // Core colors
  final Color primary;
  final Color primaryVarient;
  final Color secondary;
  final Color secondaryVarient;
  final Color background;
  final Color appBarBackground;
  final Color danger;
  final Color foregroundOnBackground;
  final Color foregroundLightOnBackground;
  final Color foregroundOnPrimary;
  final Color foregroundOnSecondary;
  final Color foregroundOnAppBar;
  final Color foregroundOnDanger;
  final Color outline;
  final Color transparant;

  // Other colors
  final Color splashColor;
  final Color disabledColor;

  factory AppColors.fromBrightness(Brightness brightness) =>
      switch (brightness) {
        Brightness.light => AppColors.light(),
        Brightness.dark => AppColors.dark(),
      };

  factory AppColors.light() {
    return const AppColors(
      primary: AppColorPalette.occeanBlue,
      primaryVarient: AppColorPalette.lightSkyBlue,
      secondary: AppColorPalette.ultraviolet,
      secondaryVarient: AppColorPalette.lightLime,
      background: AppColorPalette.white,
      appBarBackground: AppColorPalette.occeanBlue,
      danger: AppColorPalette.red,
      foregroundOnBackground: AppColorPalette.black,
      foregroundLightOnBackground: AppColorPalette.graphite,
      foregroundOnPrimary: AppColorPalette.white,
      foregroundOnSecondary: AppColorPalette.royalPurple,
      foregroundOnAppBar: AppColorPalette.white,
      foregroundOnDanger: AppColorPalette.white,
      outline: AppColorPalette.occeanBlue,
      transparant: AppColorPalette.alpha,
      splashColor: AppColorPalette.whisperingBlue,
      disabledColor: AppColorPalette.whisperingGrey,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: AppColorPalette.keylime,
      primaryVarient: AppColorPalette.lightLime,
      secondary: AppColorPalette.keylime,
      secondaryVarient: AppColorPalette.lightLime,
      background: AppColorPalette.blackLead,
      appBarBackground: AppColorPalette.darkGrey,
      danger: AppColorPalette.red,
      foregroundOnBackground: AppColorPalette.white,
      foregroundLightOnBackground: AppColorPalette.foggyGrey,
      foregroundOnPrimary: AppColorPalette.black,
      foregroundOnSecondary: AppColorPalette.black,
      foregroundOnAppBar: AppColorPalette.white,
      foregroundOnDanger: AppColorPalette.white,
      outline: AppColorPalette.keylime,
      transparant: AppColorPalette.alpha,
      splashColor: AppColorPalette.darkGrey,
      disabledColor: AppColorPalette.whisperingDeepGrey,
    );
  }

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? primaryVarient,
    Color? secondary,
    Color? secondaryVarient,
    Color? background,
    Color? appBarBackground,
    Color? danger,
    Color? foregroundOnBackground,
    Color? foregroundLightOnBackground,
    Color? foregroundOnPrimary,
    Color? foregroundOnSecondary,
    Color? foregroundOnAppBar,
    Color? foregroundOnDanger,
    Color? transparant,
    Color? outline,
    Color? splashColor,
    Color? disabledColor,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryVarient: primaryVarient ?? this.primaryVarient,
      secondary: secondary ?? this.secondary,
      secondaryVarient: secondaryVarient ?? this.secondaryVarient,
      background: background ?? this.background,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      danger: danger ?? this.danger,
      foregroundOnBackground:
          foregroundOnBackground ?? this.foregroundOnBackground,
      foregroundLightOnBackground:
          foregroundLightOnBackground ?? this.foregroundLightOnBackground,
      foregroundOnPrimary: foregroundOnPrimary ?? this.foregroundOnPrimary,
      foregroundOnSecondary:
          foregroundOnSecondary ?? this.foregroundOnSecondary,
      foregroundOnAppBar: foregroundOnAppBar ?? this.foregroundOnAppBar,
      foregroundOnDanger: foregroundOnDanger ?? this.foregroundOnDanger,
      outline: outline ?? this.outline,
      transparant: transparant ?? this.transparant,
      splashColor: splashColor ?? this.splashColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(
        primary,
        other.primary,
        t,
      )!,
      primaryVarient: Color.lerp(
        primaryVarient,
        other.primaryVarient,
        t,
      )!,
      secondary: Color.lerp(
        secondary,
        other.secondary,
        t,
      )!,
      secondaryVarient: Color.lerp(
        secondaryVarient,
        other.secondaryVarient,
        t,
      )!,
      background: Color.lerp(
        background,
        other.background,
        t,
      )!,
      appBarBackground: Color.lerp(
        appBarBackground,
        other.appBarBackground,
        t,
      )!,
      danger: Color.lerp(
        danger,
        other.danger,
        t,
      )!,
      foregroundOnBackground: Color.lerp(
        foregroundOnBackground,
        other.foregroundOnBackground,
        t,
      )!,
      foregroundLightOnBackground: Color.lerp(
        foregroundLightOnBackground,
        other.foregroundLightOnBackground,
        t,
      )!,
      foregroundOnPrimary: Color.lerp(
        foregroundOnPrimary,
        other.foregroundOnPrimary,
        t,
      )!,
      foregroundOnSecondary: Color.lerp(
        foregroundOnSecondary,
        other.foregroundOnSecondary,
        t,
      )!,
      foregroundOnAppBar: Color.lerp(
        foregroundOnAppBar,
        other.foregroundOnAppBar,
        t,
      )!,
      foregroundOnDanger: Color.lerp(
        foregroundOnDanger,
        other.foregroundOnDanger,
        t,
      )!,
      outline: Color.lerp(
        outline,
        other.outline,
        t,
      )!,
      transparant: Color.lerp(
        transparant,
        other.transparant,
        t,
      )!,
      splashColor: Color.lerp(
        splashColor,
        other.splashColor,
        t,
      )!,
      disabledColor: Color.lerp(
        disabledColor,
        other.disabledColor,
        t,
      )!,
    );
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;

    switch (brightness) {
      case Brightness.light:
        return AppColors.light();
      case Brightness.dark:
        return AppColors.dark();
      default:
        return AppColors.light();
    }
  }
}
