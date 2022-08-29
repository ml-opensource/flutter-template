import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Toaster {
  const Toaster._();

  static Future<bool?> show(
    String message, {
    bool dismissPreviousToast = false,
    Toast length = Toast.LENGTH_SHORT,
    Color? textColor,
    Color? backgroundColor,
    double? fontSize,
    ToastGravity? gravity,
  }) async {
    if (dismissPreviousToast) {
      await Fluttertoast.cancel();
    }

    return Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      textColor: textColor,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      gravity: gravity,
    );
  }

  static Future<bool?> showLong(
    String message, {
    bool dismissPreviousToast = false,
    Color? textColor,
    Color? backgroundColor,
    double? fontSize,
    ToastGravity? gravity,
  }) {
    return show(
      message,
      dismissPreviousToast: dismissPreviousToast,
      length: Toast.LENGTH_LONG,
      textColor: textColor,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      gravity: gravity,
    );
  }

  static Future<bool?> showShort(
    String message, {
    bool dismissPreviousToast = false,
    Color? textColor,
    Color? backgroundColor,
    double? fontSize,
    ToastGravity? gravity,
  }) async {
    return show(
      message,
      dismissPreviousToast: dismissPreviousToast,
      length: Toast.LENGTH_SHORT,
      textColor: textColor,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      gravity: gravity,
    );
  }
}
