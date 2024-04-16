// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_text_styles.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTextStylesTailorMixin on ThemeExtension<AppTextStyles> {
  TextStyle get header1;
  TextStyle get header2;
  TextStyle get header3;
  TextStyle get appBarTitle;
  TextStyle get bodySmall;
  TextStyle get body;
  TextStyle get bodyLarge;
  TextStyle get buttonLabel;
  TextStyle get underlineText;

  @override
  AppTextStyles copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? appBarTitle,
    TextStyle? bodySmall,
    TextStyle? body,
    TextStyle? bodyLarge,
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
  AppTextStyles lerp(covariant ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this as AppTextStyles;
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

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextStyles &&
            const DeepCollectionEquality().equals(header1, other.header1) &&
            const DeepCollectionEquality().equals(header2, other.header2) &&
            const DeepCollectionEquality().equals(header3, other.header3) &&
            const DeepCollectionEquality()
                .equals(appBarTitle, other.appBarTitle) &&
            const DeepCollectionEquality().equals(bodySmall, other.bodySmall) &&
            const DeepCollectionEquality().equals(body, other.body) &&
            const DeepCollectionEquality().equals(bodyLarge, other.bodyLarge) &&
            const DeepCollectionEquality()
                .equals(buttonLabel, other.buttonLabel) &&
            const DeepCollectionEquality()
                .equals(underlineText, other.underlineText));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(header1),
      const DeepCollectionEquality().hash(header2),
      const DeepCollectionEquality().hash(header3),
      const DeepCollectionEquality().hash(appBarTitle),
      const DeepCollectionEquality().hash(bodySmall),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(bodyLarge),
      const DeepCollectionEquality().hash(buttonLabel),
      const DeepCollectionEquality().hash(underlineText),
    );
  }
}

extension AppTextStylesBuildContextProps on BuildContext {
  AppTextStyles get appTextStyles => Theme.of(this).extension<AppTextStyles>()!;
  TextStyle get header1 => appTextStyles.header1;
  TextStyle get header2 => appTextStyles.header2;
  TextStyle get header3 => appTextStyles.header3;
  TextStyle get appBarTitle => appTextStyles.appBarTitle;
  TextStyle get bodySmall => appTextStyles.bodySmall;
  TextStyle get body => appTextStyles.body;
  TextStyle get bodyLarge => appTextStyles.bodyLarge;
  TextStyle get buttonLabel => appTextStyles.buttonLabel;
  TextStyle get underlineText => appTextStyles.underlineText;
}
