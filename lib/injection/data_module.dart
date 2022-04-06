import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/data/interceptor/auth_interceptor.dart';
import 'package:flutter_template/data/preferences/auth_preferences.dart';
import 'package:flutter_template/data/preferences/user_shared_preferences.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/data/services/http_client/http_client.dart';
import 'package:flutter_template/data/services/http_profile_service.dart';
import 'package:flutter_template/domain/api/api_config.dart';
import 'package:flutter_template/domain/preferences/user_preferences.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:flutter_template/injection/injector.dart';

class DataModule {
  static Future<void> inject() async {
    // Prefs
    injector.registerLazySingleton<AuthPreferences>(
      () => AuthPreferences(injector()),
    );
    injector.registerLazySingleton<UserPreferences>(
      () => UserSharedPreferences(injector()),
    );

    // Http
    injector.registerFactory<DioHttpClient>(() {
      return DioHttpClient(Dio());
    });

    injector.registerFactory<HttpClient>(() {
      return DioHttpClient(Dio());
    });

    injector.registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.httpClientAdapter = DefaultHttpClientAdapter();
      dio.options.baseUrl = injector.get<ApiConfig>().apiUrl;
      dio.interceptors.add(
        AuthInterceptor(
          httpClient: injector(),
          authPreferences: injector(),
          userPreferences: injector(),
          refreshTokenHttpClient: injector(),
          onTokenExpired: () {
            // Handle log out
          },
        ),
      );

      return dio;
    });

    // Services
    injector.registerLazySingleton<ProfileService>(
      () => HttpProfileService(),
    );
  }
}
