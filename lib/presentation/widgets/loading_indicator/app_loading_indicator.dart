import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  /// Determines both height and width of the [AppLoadingIndicator]
  static const defaultSize = 24.0;

  /// Determines both height and width of the [AppLoadingIndicator.small]
  static const defaultSmallSize = 16.0;

  const AppLoadingIndicator({
    super.key,
    this.size = defaultSize,
    this.strokeWidth = 4.0,
  });

  /// Determines both height and width of the loader.
  final double size;

  /// The width of the material loader stroke.
  final double strokeWidth;

  factory AppLoadingIndicator.small() {
    return const AppLoadingIndicator(
      size: defaultSmallSize,
      strokeWidth: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
      ),
    );
  }
}
