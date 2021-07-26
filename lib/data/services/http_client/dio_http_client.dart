

import 'package:dio/dio.dart';
import 'package:flutter_template/data/services/http_client/http_client.dart';
import 'package:flutter_template/data/services/response_errors.dart';

/// Abstraction of the Dio http client class.
class DioHttpClient extends HttpClient {
	DioHttpClient(this._dio);

	final Dio _dio;

	@override
	Map<String, dynamic> get headers => _dio.options.headers;

	Interceptors get interceptors => _dio.interceptors;

	@override
	void lock() => _dio.lock();

	@override
	void unlock() => _dio.unlock();

	@override
	void clear() => _dio.clear();

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
		final _options = (options ?? Options()).copyWith(
			headers: headers,
		);

		try {
			final response = await _dio.get<T>(
				path,
				options: _options,
				cancelToken: cancelToken,
				queryParameters: queryParameters,
				onReceiveProgress: onReceiveProgress,
			);
			return response.data;
		} catch (e) {
			throw ResponseErrors.fromDioError(e);
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
			final response = await _dio.post<T>(
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
			throw ResponseErrors.fromDioError(e);
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
			final response = await _dio.put<T>(
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
			throw ResponseErrors.fromDioError(e);
		}
	}

	Future<Response<T>> fetch<T>(RequestOptions options) async {
		try {
			return _dio.fetch<T>(options);
		} catch (e) {
			throw ResponseErrors.fromDioError(e);
		}
	}
}