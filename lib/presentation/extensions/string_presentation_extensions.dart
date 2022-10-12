import 'package:flutter/widgets.dart';
import 'package:flutter_template/extensions/string_extensions.dart';

extension StringPresentationExtensions on String {
  TextPainter _getTextPainter({
    TextStyle style = const TextStyle(),
    int maxLines = 1,
    double minWidth = .0,
    double maxWidth = double.infinity,
  }) {
    final text = TextSpan(text: this, style: style);
    final textPainter = TextPainter(
      maxLines: maxLines,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      text: text,
    );

    textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter;
  }

  Size getSize(
    TextStyle style, {
    int maxLines = 1,
    double minWidth = .0,
    double maxWidth = double.infinity,
  }) {
    if (isNullOrBlank) {
      return Size.zero;
    }

    final textPainter = _getTextPainter(
      style: style,
      maxLines: maxLines,
      maxWidth: maxWidth,
      minWidth: minWidth,
    );

    return textPainter.size;
  }

  bool isWithinMaxLines({
    required int maxLines,
    required double maxWidth,
    double minWidth = 0.0,
    TextStyle style = const TextStyle(),
  }) {
    if (isNullOrBlank) {
      return false;
    }

    final textPainter = _getTextPainter(
      style: style,
      maxLines: maxLines,
      maxWidth: maxWidth,
      minWidth: minWidth,
    );

    return textPainter.didExceedMaxLines;
  }
}
