/// A configuration class providing properties specific to an API.
///
/// Class instance is registered via [ApiConfigModule].
class ApiConfig {
  ApiConfig({
    required this.baseUrl,
  });

  final String baseUrl;

  String get apiUrl => '$baseUrl/api';
}
