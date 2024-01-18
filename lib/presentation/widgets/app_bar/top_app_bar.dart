import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/extensions/scroll_controller_extensions.dart';

// TODO: Replace the name with Apps-specific naming (XyzAppBar)
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    this.label,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
  });

  final String? label;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: PrimaryScrollController.maybeOf(context)?.animateToTop,
      child: AppBar(
        title: label == null ? null : Text(label!),
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
