import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
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
      final Dio dio = Dio();
      dio.httpClientAdapter = DefaultHttpClientAdapter();
      dio.options.baseUrl = injector.get<ApiConfig>().apiUrl;
      dio.interceptors.add(
        AuthInterceptor(
          httpClient: injector(),
          authPreferences: injector(),
          userPreferences: injector(),
          refreshTokenHttpClient: DioHttpClient(Dio()),
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
