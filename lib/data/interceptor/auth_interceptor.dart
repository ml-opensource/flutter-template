

import 'package:dio/dio.dart';
import 'package:flutter_template/data/model/auth/auth_status.dart';
import 'package:flutter_template/data/model/auth/token.dart';
import 'package:flutter_template/data/repository/auth_network_repository.dart';
import 'package:flutter_template/data/repository/auth_storage_repository.dart';
import 'package:flutter_template/extensions/extensions.dart';

class AuthInterceptor extends InterceptorsWrapper {
	final AuthNetworkRepository authNetworkRepository;
	final AuthStorageRepository authStorageRepository;

	AuthInterceptor(
		this.authNetworkRepository,
		this.authStorageRepository,
		);

	@override
	Future onRequest(
		RequestOptions options,
		RequestInterceptorHandler handler)
	async {
		// Ignore auth related calls.
		if (options.path.contains('auth') && !options.path.contains('/auth/password/change')) {
			return handler.next(options);
		}
		// Ignore user registration calls.
		if (!options.path.contains('users/device-tokens') &&
			options.path.contains('users') &&
			!options.path.contains('connect-stripe') &&
			!options.path.contains('addresses') &&
			options.method == 'POST') {
			return handler.next(options);
		}
		var token = await authStorageRepository
			.getToken()
			.then((value) => value)
			.catchPrintError((e, s) {
				return null;
			});

		// Refresh token.
		if (token.isExpiring) {
			token = await authNetworkRepository.refreshToken(token).then((value) {
				authStorageRepository.setToken(value.token);
				return value.token;
			}).catchPrintError((e, s) {
				// Continue with current token if still valid.
				if (token.isExpired) {
					return null;
				} else {
					return token;
				}
			});
		}
		// Add token header.
		options.addTokenHeader(token);
		super.onRequest(options, handler);
	}

	@override
	Future onError(DioError error, ErrorInterceptorHandler handler) async {
		if (error.response?.statusCode == 401) {
			await authStorageRepository.setAuthStatus(AuthStatus.expired);
		} else {
			return super.onError(error, handler);
		}
	}
}

extension RequestOptionsExtensions on RequestOptions {
	void addTokenHeader(Token token) {
		this.headers["Authorization"] = '${token.tokenType} ${token.accessToken}';
	}
}