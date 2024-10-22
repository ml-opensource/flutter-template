import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_text_styles.tailor.dart';

@TailorMixin()
class AppTextStyles extends ThemeExtension<AppTextStyles>
    with _$AppTextStylesTailorMixin {
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

  @override
  final TextStyle header1;
  @override
  final TextStyle header2;
  @override
  final TextStyle header3;
  @override
  final TextStyle appBarTitle;
  @override
  final TextStyle bodySmall;
  @override
  final TextStyle body;
  @override
  final TextStyle bodyLarge;
  @override
  final TextStyle buttonLabel;
  @override
  final TextStyle underlineText;
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
