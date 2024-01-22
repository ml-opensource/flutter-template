import 'package:flutter/material.dart';

/// Represents a collection of constants specific to the app's user interface (UI).
///
/// This class contains non-sensitive information and is designed to maintain consistency
/// across the app's UI elements.
sealed class AppUiConstants {
  AppUiConstants._();

  // Animations
  static const animationDuration = Duration(milliseconds: 250);

  // Curves
  static const transitionCurve = Curves.fastEaseInToSlowEaseOut;

  // Paddings
  static const defaultScreenHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 24.0);

  static const defaultSmallButtonContentPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  static const defaultButtonContentPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
    vertical: 18.0,
  );

  // Text styles
  static const defaultSmallButtonTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const defaultButtonTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Border radius
  /// Assign border radius value if you want to have radius on buttons, textfields, etc.
  /// Don't assign any value if you want to have the default full rounded radius (Stadium border).
  /// Example —
  /// ```dart
  /// static double? defaultBorderRadius;
  /// ````
  static double? defaultBorderRadius = 12.0;
}
