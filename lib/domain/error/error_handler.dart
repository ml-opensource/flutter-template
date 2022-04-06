import 'package:dio/dio.dart';
import 'package:flutter_template/domain/error/error.dart';

class ErrorHandler {
  static List<Error> obtainAll(dynamic error) {
    final result = <Error>[];

    if (error is DioError) {
      if (error.type != DioErrorType.response) {
        result.add(Error.connection);
        return result;
      }

      final code = error.response!.statusCode;

      if (code == 401) {
        result.add(Error.unauthorized);
      }
    }

    if (result.isEmpty) {
      result.add(Error.unknown);
    }

    return result;
  }

  static Error obtainFirst(dynamic error) {
    return obtainAll(error).first;
  }
}
