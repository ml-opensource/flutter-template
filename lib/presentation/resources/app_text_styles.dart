import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_colors.dart';
import 'package:flutter_template/presentation/resources/app_fonts.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  AppTextStyles({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.appBarTitle,
    required this.bodySmall,
    required this.body,
    required this.bodyLarge,
    required this.buttonLabel,
    required this.underlineText,
  });

  factory AppTextStyles.fromBrightness(Brightness brightness) {
    final _appColors = AppColors.fromBrightness(brightness);

    return AppTextStyles(
      header1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.activeFontFamily,
      ),
      header2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.activeFontFamily,
      ),
      header3: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.activeFontFamily,
      ),
      appBarTitle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _appColors.foregroundOnAppBar,
        fontFamily: AppFonts.activeFontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: _appColors.foregroundOnBackground,
        fontFamily: AppFonts.activeFontFamily,
      ),
      body: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: _appColors.foregroundOnBackground,
        fontFamily: AppFonts.activeFontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: _appColors.foregroundOnBackground,
        fontFamily: AppFonts.activeFontFamily,
      ),
      buttonLabel: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.activeFontFamily,
      ),
      underlineText: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: _appColors.foregroundOnBackground,
        fontFamily: AppFonts.activeFontFamily,
        decoration: TextDecoration.underline,
      ),
    );
  }

  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle appBarTitle;
  final TextStyle bodySmall;
  final TextStyle body;
  final TextStyle bodyLarge;
  final TextStyle buttonLabel;
  final TextStyle underlineText;

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? appBarTitle,
    TextStyle? bodySmall,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? buttonLabel,
    TextStyle? underlineText,
  }) {
    return AppTextStyles(
      header1: header1 ?? this.header1,
      header2: header2 ?? this.header2,
      header3: header3 ?? this.header3,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      bodySmall: bodySmall ?? this.bodySmall,
      body: body ?? this.body,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      buttonLabel: buttonLabel ?? this.buttonLabel,
      underlineText: underlineText ?? this.underlineText,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    covariant ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    if (other is! AppTextStyles) {
      return this;
    }

    return AppTextStyles(
      header1: TextStyle.lerp(header1, other.header1, t)!,
      header2: TextStyle.lerp(header2, other.header2, t)!,
      header3: TextStyle.lerp(header3, other.header3, t)!,
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      buttonLabel: TextStyle.lerp(buttonLabel, other.buttonLabel, t)!,
      underlineText: TextStyle.lerp(underlineText, other.underlineText, t)!,
    );
  }
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles {
    final appTextStyles = Theme.of(this).extension<AppTextStyles>();

    if (appTextStyles == null) {
      throw Exception(
        'Could not find the ThemeData extension for text styles.\n Make sure to pass AppTextStyles as ThemeData extension.',
      );
    }
    return appTextStyles;
  }
}
