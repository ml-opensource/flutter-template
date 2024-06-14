import 'package:flutter/widgets.dart';

extension BuildContextLocalization on BuildContext {
  /// Takes an object and, based on its type, returns the corresponding localized string.
  /// 
  /// Can localize a currency, for example, by returning its code.
  String localize(dynamic object) {
    if (object == null) {
      assert(false, 'Trying to localize a null object');
      return '';
    }

    return switch (object) {
      String => object,
      int => object.toString(),
      double => object.toString(),
      bool => object.toString(),
      _ => object.toString(),
    };
  }
}
