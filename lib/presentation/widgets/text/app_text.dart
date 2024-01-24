import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

enum _AppTextType {
  header1,
  header2,
  header3,
  appBarTitle,
  bodySmall,
  body,
  bodyLarge,
  buttonLabel,
  underlineText,
}

class AppText extends StatelessWidget {
  const AppText._(
    this.text, {
    Key? key,
    required this.type,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.fontFamily,
    this.lineHeight,
    this.fontWeight,
    this.fontSize,
    this.enableAutoTextSize = false,
  }) : super(key: key);

  factory AppText.header1(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.header1,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.header2(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.header2,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.header3(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.header3,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.appBarTitle(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.appBarTitle,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.bodySmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.bodySmall,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.body(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.body,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.bodyLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.bodyLarge,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.buttonLabel(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.buttonLabel,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.underlineText(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.underlineText,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  factory AppText.custom(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    String? fontFamily,
    double? lineHeight,
    FontWeight? fontWeight,
    double? fontSize,
    bool enableAutoTextSize = false,
  }) {
    return AppText._(
      text,
      type: _AppTextType.body,
      key: key,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
      fontWeight: fontWeight,
      fontSize: fontSize,
      enableAutoTextSize: enableAutoTextSize,
    );
  }

  final String text;
  final _AppTextType type;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final String? fontFamily;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool enableAutoTextSize;

  @override
  Widget build(BuildContext context) {
    final _appTextStyles = context.textStyles;

    final textStyle = switch (type) {
      _AppTextType.header1 => _appTextStyles.header1,
      _AppTextType.header2 => _appTextStyles.header2,
      _AppTextType.header3 => _appTextStyles.header3,
      _AppTextType.appBarTitle => _appTextStyles.appBarTitle,
      _AppTextType.bodySmall => _appTextStyles.bodySmall,
      _AppTextType.body => _appTextStyles.body,
      _AppTextType.bodyLarge => _appTextStyles.bodyLarge,
      _AppTextType.buttonLabel => _appTextStyles.buttonLabel,
      _AppTextType.underlineText => _appTextStyles.underlineText,
    };

    final customTextStyle = textStyle.copyWith(
      color: color,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

    if (enableAutoTextSize) {
      return AutoSizeText(
        text,
        style: customTextStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        minFontSize: 6,
      );
    }

    return Text(
      text,
      style: customTextStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
