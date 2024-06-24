import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:injectable/injectable.dart';

/// For authentication (sign in).
const dioForAuthentication = 'DIO_FOR_AUTHENTICATION';

/// For the authenticated endpoints.
const dioAuthenticated = 'DIO_AUTHENTICATED';

Dio _createBaseDio(ApiConfig apiConfig) {
  final dio = Dio()
    ..httpClientAdapter = HttpClientAdapter()
    ..options.baseUrl = apiConfig.apiUrl;

  return dio;
}

@module
abstract class NetworkModule {
  @singleton
  @Named(dioForAuthentication)
  Dio getForAuthenticationDio(
    ApiConfig apiConfig,
  ) {
    final dio = _createBaseDio(apiConfig);
    // TODO: Add interceptors here
    return dio;
  }

  @singleton
  @Named(dioAuthenticated)
  Dio getAuthenticatedDio(
    ApiConfig apiConfig,
  ) {
    final dio = _createBaseDio(apiConfig);
    // TODO: Add interceptors here
    return dio;
  }
}
