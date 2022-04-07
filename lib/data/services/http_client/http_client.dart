/// Abstraction of the http client class.
abstract class HttpClient {
  Map<String, dynamic> get headers;

  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<T?> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<T?> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
