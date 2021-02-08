import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color accent;
  final Color text;

  const AppColors({
    @required this.background,
    @required this.surface,
    @required this.accent,
    @required this.text,
  });
}

const _appColorsLight = AppColors(
  background: Colors.white,
  surface: Colors.white,
  accent: Colors.blueAccent,
  text: Colors.black,
);

const _appColorsDark = AppColors(
  background: Colors.black54,
  surface: Color(0xFF222222),
  accent: Colors.lightBlueAccent,
  text: Colors.white,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = MediaQuery.of(this).platformBrightness;
    switch (brightness) {
      case Brightness.light:
        return _appColorsLight;
      case Brightness.dark:
        return _appColorsDark;
      default:
        return _appColorsLight;
    }
  }
}
