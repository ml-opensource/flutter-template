import 'package:dio/dio.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';

DioHttpClient? _dioClient;

class DioHttpClientBuilder {
  late String _baseUrl;
  late Duration _sendTimeout;
  late Duration _connectTimeout;
  late Duration _receiveTimeout;
  final List<Interceptor> _interceptors = [];

  DioHttpClientBuilder setBaseUrl(String url) {
    _baseUrl = url;
    return this;
  }

  DioHttpClientBuilder setConnectTimeout(Duration connectTimeout) {
    _connectTimeout = connectTimeout;
    return this;
  }

  DioHttpClientBuilder setReceiveTimeout(Duration receiveTimeout) {
    _receiveTimeout = receiveTimeout;
    return this;
  }

  DioHttpClientBuilder setSendTimeout(Duration sendTimeout) {
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
