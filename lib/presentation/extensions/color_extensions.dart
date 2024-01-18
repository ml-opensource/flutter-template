import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Returns a new color with reduced opacity.
  ///
  /// The resulting color is a copy of the original color with an opacity
  /// level of 0.44, making it suitable for creating a visually muted or
  /// disabled appearance.
  ///
  /// Example:
  /// ```dart
  /// final myColor = Colors.blue;
  /// final mutedColor = myColor.lowOpacity();
  /// ```
  Color lowOpacity() {
    return withOpacity(0.44);
  }
}
