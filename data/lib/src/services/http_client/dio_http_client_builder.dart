import 'package:data/src/services/http_client/dio_http_client.dart';
import 'package:dio/dio.dart';

DioHttpClient? _dioClient;

class DioHttpClientBuilder {
	String baseUrl = '';
	int sendTimeout = 5000;
	int connectTimeout = 10000;
	int receiveTimeout = 15000;
	final List<Interceptor> _interceptors = [];

	void addInterceptor(Interceptor interceptor) =>
			_interceptors.add(interceptor);

	DioHttpClient build() {
		if (_dioClient != null) {
			return _dioClient!;
		}

		final options = BaseOptions()
			..baseUrl = baseUrl
			..connectTimeout = connectTimeout
			..receiveTimeout = receiveTimeout
			..sendTimeout = sendTimeout;

		final dio = Dio(options);
		dio.interceptors.addAll(_interceptors);
		_dioClient = DioHttpClient(dio);
		return _dioClient!;
	}
}
