import 'package:flutter/widgets.dart';
import 'package:flutter_template/domain/error/error.dart';

extension ErrorMessages on Error {
  String getMessage(BuildContext context) {
    switch (this) {
      case Error.unknown:
        return 'Oops! Something went wrong. Please try again later.';
      case Error.connection:
        return 'No connection. Please try again later.';
      case Error.unauthorized:
        return 'Unauthorized. Please log in again or contact support.';
      default:
        return '';
    }
  }
}
