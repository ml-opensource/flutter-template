

import 'package:flutter_template/data/model/auth/auth.dart';
import 'package:flutter_template/data/model/auth/auth_status.dart';
import 'package:flutter_template/data/model/auth/token.dart';

abstract class AuthNetworkRepository {
	Future<AuthStatus> getAuthStatus();

	Future<Stream<AuthStatus>> getAuthStatusStream();

	Future<void> setAuthStatus(AuthStatus status);

	Future<void> setToken(Token token);

	Future<Token> getToken();

	Future<Auth> refreshToken(Token token);

	Future<void> clear();
}