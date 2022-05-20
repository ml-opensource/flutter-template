import 'package:flutter/widgets.dart';

/// A widget for dismissing the keyboard on tap outside.
///
/// Wrap pages that contain text inputs with this widget
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
class BackgroundFocusScopeDismisser extends StatelessWidget {
  const BackgroundFocusScopeDismisser({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
