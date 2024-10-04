import 'package:flutter_template/config/dart_define.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiConfigModule {
  @singleton
  ApiConfig getApiConfig() {
    final apiConfig = ApiConfig(
      baseUrl: DartDefine.apiBaseUrl,
    );

    return apiConfig;
  }
}
