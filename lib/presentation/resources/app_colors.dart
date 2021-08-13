import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color accent;
  final Color text;

  const AppColors({
    required this.background,
    required this.surface,
    required this.accent,
    required this.text,
  });
}

const colorsLight = AppColors(
  background: Colors.white,
  surface: Colors.white,
  accent: Colors.blueAccent,
  text: Colors.black,
);

const colorsDark = AppColors(
  background: Colors.black54,
  surface: Color(0xFF222222),
  accent: Colors.lightBlueAccent,
  text: Colors.white,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsLight;
    }
  }
}
