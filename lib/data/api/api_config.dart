class ApiConfig {
  final String baseUrl;

  ApiConfig(this.baseUrl);

  String get apiUrl => '$baseUrl/api';
}
