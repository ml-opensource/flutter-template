import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/app_ui_constants.dart';

extension ScrollControllerExtensions on ScrollController {
  Future<void> appAnimateTo(
    double offset, {
    Duration duration = AppUiConstants.animationDuration,
    Curve curve = AppUiConstants.transitionCurve,
  }) {
    return animateTo(offset, duration: duration, curve: curve);
  }

  Future<void> animateToTop({
    Duration duration = AppUiConstants.animationDuration,
    Curve curve = Curves.fastEaseInToSlowEaseOut,
  }) {
    return appAnimateTo(0, duration: duration, curve: curve);
  }
}
