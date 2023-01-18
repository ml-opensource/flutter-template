import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:flutter_template/data/api/auth_token_storage/auth_token_storage.dart';
import 'package:flutter_template/data/api/exceptions/authenticator_exception.dart';
import 'package:flutter_template/data/api/interceptors/api_auth_interceptor.dart';
import 'package:flutter_template/data/api/interceptors/meta_interceptor.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/data/services/response_objects/tokens_response.dart';
import 'package:flutter_template/injection/network_module.dart';
import 'package:injectable/injectable.dart';

/// Is responsible for making the [accessToken] & [refreshToken] accessible
/// in the [ApiAuthInterceptor] and also for reauthenticating the user.
///
/// ---
///
/// ### Signing the user in
///
/// You must call [setNewTokens] method when you sign in the user.
/// This way you'll configure the authenticator and store the tokens to the storage.
///
/// ### Signing the user out
///
/// You must call [clear] method when you sign out the user.
/// This way you'll configure the authenticator and clear the tokens from the storage.
///
/// ### Unauthenticated callback
///
/// When [Authenticator] fails to reauthenticate, it will notify by adding
/// an event to the [onUnauthenticated] stream.
///
/// So you can listen to it, for example, in your cubit:
///
/// ```dart
/// // auth_cubit.dart:
///
/// ...
///
/// final Authenticator _authenticator;
///
/// void setup() {
///   _unauthenticatedSubscription = _authenticator
///     .onUnauthenticated
///     .listen(_onUnauthenticated);
/// }
///
/// void _onUnauthenticated(_) {
///   // Do whatever you need to sign the user out, notify the UI ...
/// }
///
/// ...
/// ```
///
/// ### Throws
/// - [AuthenticatorException.noRefreshToken] if the refresh token is missing.
/// - [AuthenticatorException.reauthenticationFailed] if the reauth response was null
/// - [AuthenticatorException.unauthorized] if the reauth request ended up in a 401 response.
@singleton
class Authenticator {
  Authenticator(
    this._storage,
    @Named(authDioClient) this._refreshTokenClient,
    this._apiConfig,
  );

  final AuthTokenStorage _storage;
  final DioHttpClient _refreshTokenClient;
  final ApiConfig _apiConfig;

  final StreamController _unauthenticatedController =
      StreamController.broadcast();

  AuthTokens? _tokens;

  String? get accessToken => _tokens?.accessToken;
  String? get refreshToken => _tokens?.refreshToken;
  bool get expiresSoon => _tokens?.expiresSoon ?? true;

  /// Fires an event when [reauthenticate] fails.
  Stream<void> get onUnauthenticated => _unauthenticatedController.stream;

  /// Clears tokens from the storage and adds an event to [_unauthenticatedController].
  Future<void> _clearTokensAndNotify() {
    return clear().then(_unauthenticatedController.add);
  }

  /// Retrieves new auth tokens and saves them to the storage.
  ///
  /// If reauthentication fails in one of the expected "unauthenticated" reasons,
  /// this method will clear the stored tokens & add an event to [_unauthenticatedController].
  ///
  /// [RequestOptions] is needed to get N-Meta information.
  Future<AuthTokens> reauthenticate(RequestOptions requestOptions) async {
    try {
      final refreshToken = this.refreshToken;

      if (refreshToken == null) {
        await _clearTokensAndNotify();
        throw const AuthenticatorException.noRefreshToken();
      }

      final response = await _refreshTokenClient.get<Map<String, dynamic>>(
        '${_apiConfig.apiUrl}/v1/auth/token',
        headers: {
          'Authorization': 'Bearer $refreshToken',
          MetaInterceptor.nMetaHeaderKey:
              requestOptions.headers[MetaInterceptor.nMetaHeaderKey]
        },
      );

      if (response == null) {
        await _clearTokensAndNotify();
        throw const AuthenticatorException.reauthenticationFailed();
      }

      final newAuthTokens =
          TokensResponse.fromJson(response['data']).getEntity();

      await _storage.set(newAuthTokens);

      return newAuthTokens;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        await _clearTokensAndNotify();
        throw const AuthenticatorException.unauthorized();
      }

      rethrow;
    }
  }

  /// When a user signs in, this must be called in order to set & save the auth tokens.
  Future<void> setNewTokens(AuthTokens tokens) async {
    return _storage.set(tokens).then((value) => _tokens = tokens);
  }

  /// When a user signs in, this must be called in order to set & save the auth tokens.
  Future<void> clear() async {
    _tokens = null;
    return _storage.clear();
  }

  @factoryMethod
  static Future<Authenticator> restore(
    AuthTokenStorage storage,
    @Named(authDioClient) DioHttpClient refreshDioClient,
    ApiConfig apiConfig,
  ) async {
    final tokens = await storage.get();

    final authenticator = Authenticator(
      storage,
      refreshDioClient,
      apiConfig,
    ).._tokens = tokens;

    return authenticator;
  }
}
