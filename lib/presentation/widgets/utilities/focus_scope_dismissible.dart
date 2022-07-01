import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// A widget for dismissing the keyboard on tap outside.
///
/// Wrap a widget that contain text inputs with this widget
/// to enable tap-outside-to-dismiss-keyboard behaviour.
///
/// So instead of this:
///
/// ```dart
/// GestureDetector(
///   onTap: () {
///      final focusScope = FocusScope.of(context);
///      if (focusScope.hasFocus) {
///        focusScope.unfocus();
///       }
///   },
///   child: MyPage(),
/// ),
/// ```
///
/// You could do this:
///
/// ```dart
/// BackgroundFocusScopeDismisser(
///   child: MyPage(),
/// ),
/// ```
class FocusScopeDismissible extends StatelessWidget {
  const FocusScopeDismissible({
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
