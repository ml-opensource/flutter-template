import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:flutter_template/data/api/authenticator/authenticator.dart';
import 'package:flutter_template/data/api/interceptors/api_auth_interceptor.dart';
import 'package:flutter_template/data/api/interceptors/meta_interceptor.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:injectable/injectable.dart';

const dioAuth = 'AUTH';
const dioRegular = 'REGULAR';
const authDioClient = 'AUTHDIOCLIENT';

Dio _createBaseDio(ApiConfig apiConfig) {
  final dio = Dio()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..options.baseUrl = apiConfig.apiUrl;

  return dio;
}

@module
abstract class NetworkModule {
  @singleton
  @Named(authDioClient)
  DioHttpClient getAuthDioClient(ApiConfig apiConfig) {
    final dio = _createBaseDio(apiConfig);
    return DioHttpClient(dio);
  }

  @singleton
  @Named(dioAuth)
  Dio getAuthDio(
    ApiConfig apiConfig,
    MetaInterceptor metaInterceptor,
  ) {
    final dio = _createBaseDio(apiConfig)..interceptors.add(metaInterceptor);
    return dio;
  }

  @singleton
  @Named(dioRegular)
  Dio getRegularDio(
    ApiConfig apiConfig,
    Authenticator authenticator,
    ApiAuthInterceptor apiAuthInterceptor,
    MetaInterceptor metaInterceptor,
  ) {
    final dio = _createBaseDio(apiConfig)
      ..interceptors.addAll(
        [apiAuthInterceptor, metaInterceptor],
      );

    return dio;
  }
}
