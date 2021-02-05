import 'package:flutter/material.dart';

class _AllColors {
  static const Color blueAccent = Colors.blueAccent;
}

class AppColors {
  final Color accent;

  const AppColors({
    @required this.accent,
  });
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => const AppColors(
        accent: _AllColors.blueAccent,
      );
}
