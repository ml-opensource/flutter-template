import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// A configuration widget designed to manage actions when tapping on the scaffold, such as dismissing the keyboard.
///
/// Wrap a widget containing text inputs with this widget to enable tap-outside-to-dismiss-keyboard behavior.
///
/// Example Usage:
/// ```dart
/// AppScreenConfig(
///   child: MyScreen(),
/// )
/// ```
///
/// Instead of manually handling tap events to dismiss the keyboard:
/// ```dart
/// GestureDetector(
///   onTap: () {
///   final focusScope = FocusScope.of(context);
///   if (focusScope.hasFocus) {
///     focusScope.unfocus();
///   }
/// },
///   child: MyScreen(),
/// ),
/// ```
///
/// You can simplify it using `AppScreenConfig`:
/// ```dart
/// AppScreenConfig(
///   child: MyScreen(),
/// ),
/// ```
class AppScreenConfig extends StatelessWidget {
  const AppScreenConfig({
    Key? key,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    required this.child,
  }) : super(key: key);

  final DragStartBehavior dragStartBehavior;
  final bool excludeFromSemantics;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: dragStartBehavior,
      excludeFromSemantics: excludeFromSemantics,
      onTap: () {
        final focusScope = FocusScope.of(context);

        if (focusScope.hasFocus) {
          focusScope.unfocus();
        }
      },
      child: child,
    );
  }
}
