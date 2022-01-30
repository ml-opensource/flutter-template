import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_template/dependencies/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModule {
  static Future<void> inject(AppFlavor flavor) async {
    // Prefs
    final sharedPrefs = await SharedPreferences.getInstance();
    final authPreferences = AuthPreferences(sharedPrefs);
    final userPreferences = UserSharedPreferences(sharedPrefs);

    final apiConfig = ApiConfig(flavor);

    // Dio instance for auth token refresh.
    final options = BaseOptions(baseUrl: apiConfig.apiUrl);
    final tokenRefreshDioClient = Dio(options);
    tokenRefreshDioClient.interceptors.add(MetaInterceptor(flavor));

    final dioClient = (DioHttpClientBuilder()
          ..baseUrl = apiConfig.apiUrl
          ..sendTimeout = 5000 // 5s
          ..connectTimeout = 10000 // 10s
          ..receiveTimeout = 15000 // 15s
          ..addInterceptor(MetaInterceptor(flavor)))
        .build();

    dioClient.interceptors.add(
      AuthInterceptor(
        httpClient: dioClient,
        authPreferences: authPreferences,
        userPreferences: userPreferences,
        refreshTokenHttpClient: DioHttpClient(tokenRefreshDioClient),
        onTokenExpired: () {
          // TODO: show session expired dialog.
        },
      ),
    );

    // Services
    dependencies.registerLazySingleton<ProfileService>(
      () => HttpProfileService(),
    );
  }
}
