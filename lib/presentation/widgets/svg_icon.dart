import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon {
  SvgIcon._private();

  /// Create icon of specific size.
  ///
  /// [size] If provided, both width and height are set to this value.
  static SvgPicture from(
    String assetName, {
    Key? key,
    double? width,
    double? height,
    double? size,
    Color? color,
    BoxFit? fit,
  }) =>
      SvgPicture.asset(
        assetName,
        key: key,
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit ?? BoxFit.contain,
      );

  /// Create a square icon with = height = 24.0
  static SvgPicture s24(String assetName, {Key? key, Color? color}) => SvgPicture.asset(
        assetName,
        key: key,
        width: 24.0,
        height: 24.0,
        color: color,
        fit: BoxFit.contain,
      );

  /// Create a square icon with = height = 30.0
  static SvgPicture s30(String assetName, {Key? key, Color? color}) => SvgPicture.asset(
    assetName,
    key: key,
    width: 30.0,
    height: 30.0,
    color: color,
    fit: BoxFit.contain,
  );

  /// Create a square icon with = height = 48.0
  static SvgPicture s48(String assetName, {Key? key, Color? color}) => SvgPicture.asset(
        assetName,
        key: key,
        width: 48.0,
        height: 48.0,
        color: color,
        fit: BoxFit.contain,
      );
}
