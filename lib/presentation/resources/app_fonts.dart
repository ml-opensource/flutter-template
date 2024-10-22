import 'package:flutter_template/gen/fonts.gen.dart';

abstract interface class AppFonts {
  AppFonts._();

  static const roboto = FontFamily.roboto;

  static String get activeFontFamily => roboto;
}
