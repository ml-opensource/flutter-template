import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_ui_constants.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class AppDisableWidget extends StatelessWidget {
  const AppDisableWidget({
    super.key,
    this.disable = true,
    this.applyBlackWhiteFilter = true,
    this.opacity = 0.66,
    this.animate = false,
    required this.child,
  });

  final bool disable;
  final double opacity;
  final bool applyBlackWhiteFilter;
  final bool animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget widget = IgnorePointer(
      ignoring: disable,
      child: child,
    );

    if (applyBlackWhiteFilter) {
      widget = ColorFiltered(
        colorFilter: ColorFilter.mode(
          disable ? context.colors.background : Colors.transparent,
          disable ? BlendMode.saturation : BlendMode.overlay,
        ),
        child: widget,
      );
    }

    final opacity = disable ? this.opacity : 1.0;

    return animate
        ? AnimatedOpacity(
            opacity: opacity,
            duration: AppUiConstants.animationDuration,
            curve: Curves.fastEaseInToSlowEaseOut,
            child: widget,
          )
        : Opacity(
            opacity: opacity,
            child: widget,
          );
  }
}
