extension StringExNullable on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullOrBlank =>
      this == null || this!.isEmpty || this!.trim().isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension StringEx on String {
  bool get isNotNullOrBlank =>
      this != 'null' && isNotEmpty && trim().isNotEmpty;

  String limit(int charCount, {bool ellipsize = false}) {
    if (isNullOrBlank) {
      return this;
    } else if (length <= charCount) {
      return this;
    } else {
      if (ellipsize) {
        return '${substring(0, charCount)}...';
      } else {
        return substring(0, charCount);
      }
    }
  }

  String withDate(String date) => replaceAll('[DATE]', date);

  String withNumber(num number) => replaceAll('[NUMBER]', number.toString());

  String withEmail(String email) => replaceAll('[EMAIL]', email);

  bool get isValidUsername => isNotNullOrBlank;
}
