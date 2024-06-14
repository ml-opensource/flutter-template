import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_color_palette.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors.tailor.dart';

@TailorMixin()
class AppColors extends ThemeExtension<AppColors> with _$AppColorsTailorMixin {
  static Color get black => AppColorPalette.black;
  static Color get white => AppColorPalette.white;

  const AppColors({
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.secondaryVariant,
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
  @override
  final Color primary;
  @override
  final Color primaryVariant;
  @override
  final Color secondary;
  @override
  final Color secondaryVariant;
  @override
  final Color background;
  @override
  final Color appBarBackground;
  @override
  final Color danger;
  @override
  final Color foregroundOnBackground;
  @override
  final Color foregroundLightOnBackground;
  @override
  final Color foregroundOnPrimary;
  @override
  final Color foregroundOnSecondary;
  @override
  final Color foregroundOnAppBar;
  @override
  final Color foregroundOnDanger;
  @override
  final Color outline;
  @override
  final Color transparant;

  // Other colors
  @override
  final Color splashColor;
  @override
  final Color disabledColor;

  factory AppColors.fromBrightness(Brightness brightness) =>
      switch (brightness) {
        Brightness.light => AppColors.light(),
        Brightness.dark => AppColors.dark(),
      };

  factory AppColors.light() {
    return const AppColors(
      primary: AppColorPalette.oceanBlue,
      primaryVariant: AppColorPalette.lightSkyBlue,
      secondary: AppColorPalette.ultraviolet,
      secondaryVariant: AppColorPalette.lightLime,
      background: AppColorPalette.white,
      appBarBackground: AppColorPalette.oceanBlue,
      danger: AppColorPalette.red,
      foregroundOnBackground: AppColorPalette.black,
      foregroundLightOnBackground: AppColorPalette.graphite,
      foregroundOnPrimary: AppColorPalette.white,
      foregroundOnSecondary: AppColorPalette.royalPurple,
      foregroundOnAppBar: AppColorPalette.white,
      foregroundOnDanger: AppColorPalette.white,
      outline: AppColorPalette.oceanBlue,
      transparant: AppColorPalette.alpha,
      splashColor: AppColorPalette.whisperingBlue,
      disabledColor: AppColorPalette.mutedGrey,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: AppColorPalette.americanOrange,
      primaryVariant: AppColorPalette.cantaloupe,
      secondary: AppColorPalette.keylime,
      secondaryVariant: AppColorPalette.lightLime,
      background: AppColorPalette.blackLead,
      appBarBackground: AppColorPalette.darkGrey,
      danger: AppColorPalette.red,
      foregroundOnBackground: AppColorPalette.white,
      foregroundLightOnBackground: AppColorPalette.foggyGrey,
      foregroundOnPrimary: AppColorPalette.black,
      foregroundOnSecondary: AppColorPalette.black,
      foregroundOnAppBar: AppColorPalette.white,
      foregroundOnDanger: AppColorPalette.white,
      outline: AppColorPalette.americanOrange,
      transparant: AppColorPalette.alpha,
      splashColor: AppColorPalette.darkGrey,
      disabledColor: AppColorPalette.silverPolish,
    );
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final appColors = Theme.of(this).extension<AppColors>();

    if (appColors == null) {
      throw Exception(
        'Could not find the ThemeData extension for colors.\n Make sure to pass AppColors as ThemeData extension.',
      );
    }

    return appColors;
  }
}
