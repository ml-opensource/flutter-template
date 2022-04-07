import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/data/interceptor/auth_interceptor.dart';
import 'package:flutter_template/data/interceptor/meta_interceptor.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/domain/api/api_config.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'injector.dart';

class NetworkModule {
  static const String instanceDefault = 'default';
  static const String instanceAuth = 'auth';

  static Future<void> inject(AppFlavor flavor) async {
    injector.registerLazySingleton<Dio>(
      () {
        final dio = Dio();
        dio
          ..httpClientAdapter = DefaultHttpClientAdapter()
          ..options.baseUrl = injector.get<ApiConfig>().apiUrl
          ..interceptors.add(MetaInterceptor(flavor))
          ..interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ));
        if (kDebugMode) {
          checkForCharlesProxy(dio);
        }
        return dio;
      },
      instanceName: instanceAuth,
    );

    injector.registerLazySingleton<Dio>(
      () {
        final dio = Dio();
        dio
          ..httpClientAdapter = DefaultHttpClientAdapter()
          ..options.baseUrl = injector.get<ApiConfig>().apiUrl
          ..interceptors.add(MetaInterceptor(flavor))
          ..interceptors.add(
            AuthInterceptor(
              httpClient: DioHttpClient(dio),
              authPreferences: injector(),
              userPreferences: injector(),
              refreshTokenHttpClient: DioHttpClient(
                injector.get<Dio>(instanceName: instanceAuth),
              ),
              onTokenExpired: () {
                // Handle log out
              },
            ),
          )
          ..interceptors.add(PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true,
              error: true,
              compact: true,
              maxWidth: 90));

        // Configure charles for debugging
        if (flavor != AppFlavor.production) {
          checkForCharlesProxy(dio);
        }
        return dio;
      },
      instanceName: instanceDefault,
    );
  }

  static void checkForCharlesProxy(Dio dio) {
    const charlesIp = bool.hasEnvironment('CHARLES_PROXY_IP')
        ? String.fromEnvironment('CHARLES_PROXY_IP')
        : null;
    if (charlesIp == null) return;
    debugPrint('#CharlesProxyEnabled');
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => 'PROXY $charlesIp:8888;';
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
