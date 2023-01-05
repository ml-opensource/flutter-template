import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/exceptions/token_unauthorized_exception.dart';
import 'package:flutter_template/data/api/new/authenticator/authenticator.dart';
import 'package:flutter_template/injection/network_module.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiAuthInterceptor extends QueuedInterceptor {
  ApiAuthInterceptor(
    @Named(dioAuth) this._dio,
    this._authenticator,
  );

  final Dio _dio;
  final Authenticator _authenticator;

  void _setAuthHeader(RequestOptions options) {
    final accessToken = _authenticator.accessToken;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  Future<void> _reauthenticateIfNeeded(RequestOptions options) async {
    if (_authenticator.expiresSoon) {
      await _authenticator.reauthenticate(options);
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      await _reauthenticateIfNeeded(options);
    } on Exception catch (e) {
      handler.reject(DioError(requestOptions: options, error: e));
      return;
    }

    _setAuthHeader(options);

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    // The error is not a 401 error — so nothing to handle in this interceptor.
    // Let other interceptors work.
    if (err.response?.statusCode != 401) {
      handler.next(err);

      return;
    }

    try {
      await _authenticator.reauthenticate(err.requestOptions);
    } on Exception catch (e) {
      handler.reject(
        DioError(
          requestOptions: err.requestOptions,
          error: e,
          response: err.response,
        ),
      );

      return;
    }

    final options = err.requestOptions;

    _setAuthHeader(options);

    // Try to redo the  request using the new auth token

    try {
      final response = await _dio.fetch(options);
      handler.resolve(response);
    } on DioError catch (e) {
      // As we've tried to handle the 401 error, seeing this error again
      // means that even with the new token we're unable to proceed any further.
      // We must log the user out.
      if (e.response?.statusCode == 401) {
        final error = DioError(
          requestOptions: options,
          error: const TokenUnauthorizedException(),
          response: e.response,
        );

        handler.reject(error);
      } else {
        // In case of other errors — let other interceptors work.

        handler.next(e);
      }
    }
  }
}
