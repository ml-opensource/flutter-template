import 'package:flutter/foundation.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T> catchPrintError(Function onError) {
    return catchError((e, s) {
      if (kDebugMode) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
      onError.call(e, s);
    });
  }
}
