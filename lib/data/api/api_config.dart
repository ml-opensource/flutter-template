import 'package:flutter_template/presentation/application_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiConfig {
  final String baseUrl;

  ApiConfig(ApplicationConfig appConfig) : baseUrl = appConfig.apiUrl;

  String get apiUrl => '$baseUrl/api';
  String get reauthUrl => '$baseUrl/api//v1/auth/token';
}
