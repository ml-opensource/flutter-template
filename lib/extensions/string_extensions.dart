
import 'package:flutter/widgets.dart';

extension StringEx on String {
	bool get isNullOrEmpty => this == null || this.isEmpty;

	bool get isNullOrBlank => this == null || this.isEmpty || this.trim().isEmpty;

	bool get isNotNullOrEmpty => this != null && this.isNotEmpty;

	bool get isNotNullOrBlank =>
		this != null &&
			this != 'null' &&
			this.isNotEmpty &&
			this.trim().isNotEmpty;

	String limit(int charCount, {bool ellipsize = false}) {
		if (this.isNullOrBlank) {
			return this;
		} else if (this.length <= charCount) {
			return this;
		} else {
			if (ellipsize) {
				return '${this.substring(0, charCount)}...';
			} else {
				return this.substring(0, charCount);
			}
		}
	}

	bool isWithinMaxLines(
		{required int maxLines,
			required double maxWidth,
			double minWidth = 0.0,
			TextStyle style = const TextStyle()}) {
		if (this.isNullOrBlank) {
			return false;
		}

		final text = TextSpan(text: this, style: style);
		final textPainter = TextPainter(
			maxLines: maxLines,
			textAlign: TextAlign.left,
			textDirection: TextDirection.ltr,
			text: text,
		);

		textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);
		return textPainter.didExceedMaxLines;
	}

	String withDate(String date) => this.replaceAll('[DATE]', date);

	String withNumber(num number) =>
		this.replaceAll('[NUMBER]', number.toString());

	String withEmail(String email) => this.replaceAll('[EMAIL]', email ?? '');

	bool get isValidUsername => this.isNotNullOrBlank;
}