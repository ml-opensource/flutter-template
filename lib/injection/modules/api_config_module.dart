import 'package:flutter_template/data/api/api_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiConfigModule {
  @singleton
  ApiConfig getApiConfig() {
    final apiConfig = ApiConfig(
      baseUrl: const String.fromEnvironment('API_BASE_URL'),
    );

    return apiConfig;
  }
}
