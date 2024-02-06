// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorsTailorMixin on ThemeExtension<AppColors> {
  Color get primary;
  Color get primaryVariant;
  Color get secondary;
  Color get secondaryVariant;
  Color get background;
  Color get appBarBackground;
  Color get danger;
  Color get foregroundOnBackground;
  Color get foregroundLightOnBackground;
  Color get foregroundOnPrimary;
  Color get foregroundOnSecondary;
  Color get foregroundOnAppBar;
  Color get foregroundOnDanger;
  Color get outline;
  Color get transparant;
  Color get splashColor;
  Color get disabledColor;

  @override
  AppColors copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? secondary,
    Color? secondaryVariant,
    Color? background,
    Color? appBarBackground,
    Color? danger,
    Color? foregroundOnBackground,
    Color? foregroundLightOnBackground,
    Color? foregroundOnPrimary,
    Color? foregroundOnSecondary,
    Color? foregroundOnAppBar,
    Color? foregroundOnDanger,
    Color? outline,
    Color? transparant,
    Color? splashColor,
    Color? disabledColor,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: secondary ?? this.secondary,
      secondaryVariant: secondaryVariant ?? this.secondaryVariant,
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
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this as AppColors;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant:
          Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
      background: Color.lerp(background, other.background, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      foregroundOnBackground:
          Color.lerp(foregroundOnBackground, other.foregroundOnBackground, t)!,
      foregroundLightOnBackground: Color.lerp(
          foregroundLightOnBackground, other.foregroundLightOnBackground, t)!,
      foregroundOnPrimary:
          Color.lerp(foregroundOnPrimary, other.foregroundOnPrimary, t)!,
      foregroundOnSecondary:
          Color.lerp(foregroundOnSecondary, other.foregroundOnSecondary, t)!,
      foregroundOnAppBar:
          Color.lerp(foregroundOnAppBar, other.foregroundOnAppBar, t)!,
      foregroundOnDanger:
          Color.lerp(foregroundOnDanger, other.foregroundOnDanger, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      transparant: Color.lerp(transparant, other.transparant, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality()
                .equals(primaryVariant, other.primaryVariant) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality()
                .equals(secondaryVariant, other.secondaryVariant) &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(appBarBackground, other.appBarBackground) &&
            const DeepCollectionEquality().equals(danger, other.danger) &&
            const DeepCollectionEquality()
                .equals(foregroundOnBackground, other.foregroundOnBackground) &&
            const DeepCollectionEquality().equals(foregroundLightOnBackground,
                other.foregroundLightOnBackground) &&
            const DeepCollectionEquality()
                .equals(foregroundOnPrimary, other.foregroundOnPrimary) &&
            const DeepCollectionEquality()
                .equals(foregroundOnSecondary, other.foregroundOnSecondary) &&
            const DeepCollectionEquality()
                .equals(foregroundOnAppBar, other.foregroundOnAppBar) &&
            const DeepCollectionEquality()
                .equals(foregroundOnDanger, other.foregroundOnDanger) &&
            const DeepCollectionEquality().equals(outline, other.outline) &&
            const DeepCollectionEquality()
                .equals(transparant, other.transparant) &&
            const DeepCollectionEquality()
                .equals(splashColor, other.splashColor) &&
            const DeepCollectionEquality()
                .equals(disabledColor, other.disabledColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(primaryVariant),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(secondaryVariant),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(appBarBackground),
      const DeepCollectionEquality().hash(danger),
      const DeepCollectionEquality().hash(foregroundOnBackground),
      const DeepCollectionEquality().hash(foregroundLightOnBackground),
      const DeepCollectionEquality().hash(foregroundOnPrimary),
      const DeepCollectionEquality().hash(foregroundOnSecondary),
      const DeepCollectionEquality().hash(foregroundOnAppBar),
      const DeepCollectionEquality().hash(foregroundOnDanger),
      const DeepCollectionEquality().hash(outline),
      const DeepCollectionEquality().hash(transparant),
      const DeepCollectionEquality().hash(splashColor),
      const DeepCollectionEquality().hash(disabledColor),
    );
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  Color get primary => appColors.primary;
  Color get primaryVariant => appColors.primaryVariant;
  Color get secondary => appColors.secondary;
  Color get secondaryVariant => appColors.secondaryVariant;
  Color get background => appColors.background;
  Color get appBarBackground => appColors.appBarBackground;
  Color get danger => appColors.danger;
  Color get foregroundOnBackground => appColors.foregroundOnBackground;
  Color get foregroundLightOnBackground =>
      appColors.foregroundLightOnBackground;
  Color get foregroundOnPrimary => appColors.foregroundOnPrimary;
  Color get foregroundOnSecondary => appColors.foregroundOnSecondary;
  Color get foregroundOnAppBar => appColors.foregroundOnAppBar;
  Color get foregroundOnDanger => appColors.foregroundOnDanger;
  Color get outline => appColors.outline;
  Color get transparant => appColors.transparant;
  Color get splashColor => appColors.splashColor;
  Color get disabledColor => appColors.disabledColor;
}
