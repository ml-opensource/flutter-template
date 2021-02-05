import 'package:flutter/material.dart';

class _TextStyles {
  static const headline1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 34,
  );
}

class AppTextStyles {
  final TextStyle headline1;

  const AppTextStyles({
    @required this.headline1,
  });
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles(
        headline1: _TextStyles.headline1,
      );
}
