import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsLight : colorsDark;

  return ThemeData(
    brightness: brightness,
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(brightness: brightness),
  );
}
