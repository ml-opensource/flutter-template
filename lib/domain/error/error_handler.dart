import 'package:dio/dio.dart';
import 'package:flutter_template/domain/error/error.dart';

class ErrorHandler {
  static List<Error> obtainAll(dynamic error) {
    final result = List<Error>();

    if (error is DioError) {
      if (error.type != DioErrorType.RESPONSE) {
        result.add(Error.connection);
        return result;
      }

      final code = error.response.statusCode;

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
