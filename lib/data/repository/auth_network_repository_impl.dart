import 'package:dio/dio.dart';
import 'package:flutter_template/data/model/auth/auth.dart';
import 'package:flutter_template/data/model/auth/auth_status.dart';
import 'package:flutter_template/data/model/auth/token.dart';
import 'package:flutter_template/data/repository/auth_network_repository.dart';

class AuthNetworkRepositoryImpl implements AuthNetworkRepository {
  final Dio dio;

  AuthNetworkRepositoryImpl(this.dio);

  @override
  Future<AuthStatus> getAuthStatus() async {
    throw UnsupportedError('Not supported via network.');
  }

  @override
  Future<Stream<AuthStatus>> getAuthStatusStream() async {
    throw UnsupportedError('Not supported via network.');
  }

  @override
  Future<Token> getToken() async {
    throw UnsupportedError('Not supported via network.');
  }

  @override
  Future<Auth> refreshToken(Token token) async {
    final response = await dio.get(
      "/auth/refresh-token",
      options: Options(
        headers: {
          'Authorization': '${token.tokenType} ${token.accessToken}',
        },
      ),
    );
    return Auth.fromJson(response.data);
  }

  @override
  Future<void> setAuthStatus(AuthStatus status) async {
    throw UnsupportedError('Not supported via network.');
  }

  @override
  Future<void> setToken(Token token) async {
    throw UnsupportedError('Not supported via network.');
  }

  @override
  Future<void> clear() async {
    throw UnsupportedError('Not supported via network.');
  }
}
