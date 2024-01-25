import 'package:flutter/material.dart';

/// A very simple dialog to indicate that something was not implemented yet.
///
/// Show it like this:
/// ```dart
/// onPressed: () {
///   NotImplementedDialog.show(context);
///   // Or:
///   context.notImplementedYet();
/// },
/// ```
class NotImplementedDialog extends StatelessWidget {
  const NotImplementedDialog._({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const NotImplementedDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Not implemented yet'),
      content: const Text('This was not implemented yet!'),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

extension NotImplementedDialogBuildContextExtension on BuildContext {
  /// Displays a [NotImplementedDialog].
  Future<void> notImplementedYet() => NotImplementedDialog.show(this);
}
