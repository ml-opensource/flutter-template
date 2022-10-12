import 'package:flutter/widgets.dart';
import 'package:flutter_template/extensions/string_extensions.dart';

extension StringPresentationExtensions on String {
  Size getSize(
    TextStyle style, {
    int maxLines = 1,
    double minWidth = .0,
    double maxWidth = double.infinity,
  }) {
    if (isNullOrBlank) {
      return Size.zero;
    }

    final text = TextSpan(text: this, style: style);
    final textPainter = TextPainter(
      maxLines: maxLines,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      text: text,
    );

    textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);

    return textPainter.size;
  }
}
