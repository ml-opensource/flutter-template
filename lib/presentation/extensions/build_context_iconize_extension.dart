import 'package:flutter/widgets.dart';

extension BuildContextIconize on BuildContext {
  // Takes an object and, based on its type, returns the corresponding icon widget.
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
