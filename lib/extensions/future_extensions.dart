import 'package:flutter/foundation.dart';
import 'package:flutter_template/data/response_objects/response_error.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T> catchPrintError(Function onError) {
    return catchError((e, s) {
      if (kDebugMode) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }

      final error = ResponseError.from(e);

      onError.call(error, s);
    });
  }
}
