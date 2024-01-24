import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/extensions/scroll_controller_extensions.dart';

/// A configurable widget designed for defining actions triggered by tapping on the [Scaffold]'s top app bar.
///
/// The primary use case for this widget is to facilitate scrolling to the top of the screen.
/// If the screen is already scrolled to the top, the widget will alternatively unfocus and
/// dismiss the keyboard if it is currently shown.
class TopAppBarConfig extends StatelessWidget {
  const TopAppBarConfig({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = PrimaryScrollController.maybeOf(context);

        if (controller?.position.pixels == 0.0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }

        controller?.animateToTop();
      },
      child: child,
    );
  }
}
