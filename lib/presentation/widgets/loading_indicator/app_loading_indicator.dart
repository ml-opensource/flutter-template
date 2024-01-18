import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  /// Determines both height and width of the [AppLoadingIndicator]
  static const defaultSize = 24.0;

  /// Determines both height and width of the [AppLoadingIndicator.small]
  static const defaultSmallSize = 16.0;

  /// Determines the color of the loading indicator.
  ///
  /// By default, It will follow the primary color of the current theme.
  final Color? indicatorColor;

  const AppLoadingIndicator({
    super.key,
    this.size = defaultSize,
    this.strokeWidth = 4.0,
    this.indicatorColor,
  });

  /// Determines both height and width of the loader.
  final double size;

  /// The width of the material loader stroke.
  final double strokeWidth;

  factory AppLoadingIndicator.small({
    Color? indicatorColor,
  }) {
    return AppLoadingIndicator(
      size: defaultSmallSize,
      strokeWidth: 2.0,
      indicatorColor: indicatorColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
        backgroundColor: indicatorColor,
      ),
    );
  }
}
