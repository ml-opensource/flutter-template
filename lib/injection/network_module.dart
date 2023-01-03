import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:flutter_template/data/interceptor/auth_interceptor.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:injectable/injectable.dart';

const dioAuth = 'AUTH';
const dioRegular = 'REGULAR';

Dio _getBaseDio(ApiConfig apiConfig) {
  final dio = Dio()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..options.baseUrl = apiConfig.apiUrl;

  return dio;
}

@module
abstract class NetworkModule {
  @singleton
  @Named(dioAuth)
  Dio getAuthDio(ApiConfig apiConfig) {
    final dio = _getBaseDio(apiConfig);
    return dio;
  }

  @singleton
  @Named(dioRegular)
  Dio getRegularDio(ApiConfig apiConfig) {
    final dio = _getBaseDio(apiConfig);

    final httpClient = DioHttpClient(dio);
    final refreshTokenHttpClient = DioHttpClient(
      injector.get<Dio>(instanceName: dioRegular),
    );

    dio.interceptors.add(
      AuthInterceptor(
        httpClient: httpClient,
        refreshTokenHttpClient: refreshTokenHttpClient,
        authPreferences: injector(),
        userPreferences: injector(),
        onTokenExpired: () {
          // TODO: Handle log out
        },
      ),
    );

    return dio;
  }
}
