import 'package:flutter/material.dart';

/// Create safe area space. Useful for the beginning/end of the pages
/// to make sure the "padding" of it is above the safe area.
class SafeAreaSpacer extends StatelessWidget {
  const SafeAreaSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.maybePaddingOf(context);

    if (padding == null) {
      return const SizedBox.shrink();
    }

    final insets = padding.bottom;

    return SizedBox(height: insets);
  }
}
