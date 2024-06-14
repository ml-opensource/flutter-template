import 'package:dio/dio.dart';
import 'package:flutter_template/data/response_objects/response_error.dart';
import 'package:flutter_template/data/services/http_client/http_client.dart';
import 'package:injectable/injectable.dart';

/// Abstraction of the Dio http client class.

@Injectable(as: HttpClient)
class DioHttpClient extends HttpClient {
  DioHttpClient(this.dio);

  final Dio dio;

  @override
  Map<String, dynamic> get headers => dio.options.headers;

  Interceptors get interceptors => dio.interceptors;

  /// Invoke the get method in the provided [Dio] instance.
  ///
  /// [T] is the type of data in case of success.
  ///
  /// Either return the data or throws a [ResponseErrors] object containing
  /// the error cause.
  @override
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final optionsFallback = (options ?? Options()).copyWith(
      headers: headers,
    );

    try {
      final response = await dio.get<T>(
        path,
        options: optionsFallback,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw ResponseError.from(e);
    }
  }

  /// Invoke the post method in the provided [Dio] instance.
  ///
  /// [T] is the type of data in case of success.
  ///
  /// Either return the data or throws a [ResponseErrors] object containing
  /// the error cause.
  @override
  Future<T?> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw ResponseError.from(e);
    }
  }

  /// Invoke the put method in the provided [Dio] instance.
  ///
  /// [T] is the type of data in case of success.
  ///
  /// Either return the data or throws a [ResponseErrors] object containing
  /// the error cause.
  @override
  Future<T?> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.put<T>(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      // ignore: only_throw_errors
      throw ResponseError.from(e);
    }
  }

  Future<Response<T>> fetch<T>(RequestOptions options) async {
    try {
      return dio.fetch<T>(options);
    } catch (e) {
      throw ResponseError.from(e);
    }
  }
}
