import 'package:flutter/material.dart';

/// Defines color palette for the application.
///
/// Consider using the color name that is mentioned in Figma.
sealed class AppColorPalette {
  const AppColorPalette._();

  static const alpha = Colors.transparent;

  static const americanOrange = Color(0xFFFF8800);
  static const black = Color(0xFF000000);
  static const blackLead = Color(0xFF202020);
  static const cantaloupe = Color(0xFFFFE600);
  static const darkGrey = Color(0xFF171717);
  static const foggyGrey = Color(0xFF363636);
  static const mutedGrey = Color(0xFF444444);
  static const graphite = Color(0xFF444444);
  static const keylime = Color(0xFFF0E68C);
  static const lightLime = Color(0xFFF9F3C2);
  static const lightSkyBlue = Color(0xFF4C9DFF);
  static const oceanBlue = Color(0xFF1976D2);
  static const red = Color(0xFFDD2C00);
  static const silverPolish = Color(0xFFC6C6C6);
  static const royalPurple = Color(0xFF4444DA);
  static const ultraviolet = Color(0xFFB2AEF3);
  static const white = Color(0xFFFFFFFF);
  static const whisperingBlue = Color(0xFFD4E4FC);
}
