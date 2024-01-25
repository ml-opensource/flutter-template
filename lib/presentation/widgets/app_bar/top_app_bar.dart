import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_colors.dart';
import 'package:flutter_template/presentation/widgets/utilities/top_app_bar_config.dart';
import 'package:flutter_template/presentation/widgets/text/app_text.dart';

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
    return TopAppBarConfig(
      child: AppBar(
        title: label == null
            ? null
            : AppText.appBarTitle(
                label!,
                color: context.colors.foregroundOnAppBar,
              ),
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
