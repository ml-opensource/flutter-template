import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/data/interceptor/meta_interceptor.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_template/data/preferences/auth_preferences.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/data/services/response_errors.dart';
import 'package:flutter_template/data/services/response_objects/tokens_response.dart';
import 'package:flutter_template/domain/preferences/user_preferences.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor({
    required this.httpClient,
    required this.onTokenExpired,
    required this.authPreferences,
    required this.userPreferences,
    required this.refreshTokenHttpClient,
  });

  final DioHttpClient httpClient;
  final DioHttpClient refreshTokenHttpClient;
  final AuthPreferences authPreferences;
  final UserPreferences userPreferences;

  /// Called if token has expired.
  final VoidCallback onTokenExpired;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Don't add Token into paths that don't require authentication.
    if (authPreferences.hasValidAccessToken) {
      options.headers['Authorization'] =
          'Bearer ${authPreferences.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // If it is not an authenticated path or it is
    // not an Unauthorized status code, move forward.
    if (err.response?.statusCode != 401) {
      handler.next(err);
    }

    try {
      final tokens = await _getNewTokens(requestOptions);
      await _saveTokensAndRetryCurrentRequest(tokens, requestOptions, handler);
    } on ResponseErrors {
      await _clearUserSessionAndNotifyCallback();
    } on DioError catch (e) {
      handler.reject(e);
    }
  }

  Future _saveTokensAndRetryCurrentRequest(
    AuthTokens tokens,
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    await authPreferences.setAuthTokens(tokens);
    // Update headers and retry the first failed request.
    requestOptions.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    handler.resolve(await httpClient.fetch(requestOptions));
  }

  Future _clearUserSessionAndNotifyCallback() async {
    await authPreferences.clearAll();
    await userPreferences.clearAll();
    onTokenExpired();
  }

  /// RequestOptions is needed to get N-Meta information and base URL.
  Future<AuthTokens> _getNewTokens(RequestOptions requestOptions) async {
    try {
      final response = await refreshTokenHttpClient.get<Map<String, dynamic>>(
        '${requestOptions.baseUrl}v1/auth/token',
        headers: {
          'Authorization': 'Bearer ${authPreferences.refreshToken}',
          MetaInterceptor.nMetaHeaderKey:
              requestOptions.headers[MetaInterceptor.nMetaHeaderKey]
        },
      );

      if (response == null) {
        throw const ResponseErrors.unprocessableEntity();
      }

      return TokensResponse.fromJson(response['data']).getEntity();
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw const ResponseErrors.unauthorized();
      }
      rethrow;
    }
  }
}
