import 'package:flutter/widgets.dart';

extension BuildContextIconize on BuildContext {
  /// Takes an object and, based on its type, returns the corresponding icon widget.
  /// 
  /// For example, in a list view you can do the following:
  /// 
  /// ```dart
  /// Row(
  ///   children: [
  ///     context.iconize(object),
  ///     const SizedBox(width: 8.0),
  ///     Text(context.localize(object)),
  ///   ],
  /// )
  /// ```
  Widget iconize(dynamic object) {
    if (object == null) {
      assert(false, 'Trying to iconize a null object');
      return const SizedBox.shrink();
    }

    final icon = switch (object) {
      // Handle your enums, objects etc.
      _ => null,
    };

    if (icon == null) {
      assert(false, 'No icon found for $object');
      return const SizedBox.shrink();
    }

    return icon;
  }
}
