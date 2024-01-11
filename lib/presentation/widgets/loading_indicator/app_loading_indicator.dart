import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  /// Determines both height and width of the [AppLoadingIndicator]
  static const defaultSize = 24.0;

  /// Determines both height and width of the [AppLoadingIndicator.small]
  static const defaultSmallSize = 16.0;

  const AppLoadingIndicator({
    super.key,
    this.size = defaultSize,
  });

  /// Determines both height and width of the loader.
  final double size;

  factory AppLoadingIndicator.small() {
    return const AppLoadingIndicator(
      size: defaultSmallSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
