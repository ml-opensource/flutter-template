import 'package:data/src/services/http_client/dio_http_client.dart';
import 'package:dio/dio.dart';

DioHttpClient? _dioClient;

class DioHttpClientBuilder {
	late String _baseUrl;
	late int _sendTimeout;
	late int _connectTimeout;
	late int _receiveTimeout;
	final List<Interceptor> _interceptors = [];

	DioHttpClientBuilder setBaseUrl(String url) {
		_baseUrl = url;
		return this;
	}

	DioHttpClientBuilder setConnectTimeout(int connectTimeout) {
		_connectTimeout = connectTimeout;
		return this;
	}

	DioHttpClientBuilder setReceiveTimeout(int receiveTimeout) {
		_receiveTimeout = receiveTimeout;
		return this;
	}

	DioHttpClientBuilder setSendTimeout(int sendTimeout) {
		_sendTimeout = sendTimeout;
		return this;
	}

	DioHttpClientBuilder addInterceptor(Interceptor interceptor) {
		_interceptors.add(interceptor);
		return this;
	}

	DioHttpClient build() {
		if (_dioClient != null) {
			return _dioClient!;
		}

		final options = BaseOptions()
			..baseUrl = _baseUrl
			..connectTimeout = _connectTimeout
			..receiveTimeout = _receiveTimeout
			..sendTimeout = _sendTimeout;

		final dio = Dio(options);
		dio.interceptors.addAll(_interceptors);
		_dioClient = DioHttpClient(dio);
		return _dioClient!;
	}
}