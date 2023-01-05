import 'package:flutter_template/data/api/interceptors/api_auth_interceptor.dart';

/// An exception indicating that token was invalid even after reauthentication.
/// See [ApiAuthInterceptor].
class TokenUnauthorizedException implements Exception {
  final String message;

  const TokenUnauthorizedException([this.message = '']);

  @override
  String toString() {
    return '${runtimeType.toString()}: $message';
  }
}
