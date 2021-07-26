

import 'package:dio/dio.dart';
import 'package:flutter_template/data/interceptor/meta_interceptor.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_template/data/preferences/auth_preferences.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/data/services/http_client/http_client.dart';
import 'package:flutter_template/data/services/response_errors.dart';
import 'package:flutter_template/data/services/response_objects/tokens_response.dart';
import 'package:flutter_template/domain/preferences/user_preferences.dart';
import 'package:flutter_template/extensions/extensions.dart';

class AuthInterceptor extends InterceptorsWrapper {
	AuthInterceptor({
		required this.httpClient,
		required this.onTokenExpired,
		required this.authPreferences,
		required this.userPreferences,
		required this.refreshTokenHttpClient,
	});

	final DioHttpClient httpClient;
	final DioHttpClient refreshTokenHttpClient;
	final AuthPreferences authPreferences;
	final UserPreferences userPreferences;

	/// Called if token has expired.
	final VoidCallback onTokenExpired;

	/// Whether request requires authentication or not.
	bool isAuthenticatedPath(RequestOptions options) {
		return !HttpClient.nonAuthenticatedPaths.contains(options.path);
	}

	@override
	void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
		// Don't add Token into paths that don't require authentication.
		if (isAuthenticatedPath(options) && authPreferences.hasValidAccessToken) {
			options.headers['Authorization'] =
			'Bearer ${authPreferences.accessToken}';
		}
		handler.next(options);
	}

	_TokenRefreshStatus _tokenRefreshState = _TokenRefreshStatus.none;
	DioError? _tokenRefreshDioError;

	@override
	Future onError(DioError err, ErrorInterceptorHandler handler) async {
		final requestOptions = err.requestOptions;

		// If it is not an authenticated path or it is
		// not an Unauthorized status code, move forward.
		if (!isAuthenticatedPath(requestOptions) ||
			err.response?.statusCode != 401) {
			_tokenRefreshState = _TokenRefreshStatus.none;
			handler.next(err);
			return;
		} else if (_tokenRefreshState.hasExpired) {
			handler.reject(err);
			return;
		} else if (_tokenRefreshState.hasFailed) {
			handler.reject(_tokenRefreshDioError!);
			return;
		}

		// If token update is currently in progress, then we retry all the
		// subsequent requests until the token is updated.
		//
		// Using this boolean to lock requests because of an issue with Dio,
		// even though we use Dio lock()/unlock() methods, we still need a boolean
		// to assert that only one token-refresh operation will occur.
		// See https://github.com/flutterchina/dio/issues/590.
		if (_tokenRefreshState.isInProgress) {
			handler.resolve(await httpClient.fetch(requestOptions));
			return;
		}

		// Lock all requests.
		httpClient.lock();
		_tokenRefreshState = _TokenRefreshStatus.inProgress;

		try {
			final tokens = await _getNewTokens(requestOptions);
			await _saveTokensAndRetryCurrentRequest(tokens, requestOptions, handler);
		} on ResponseErrors {
			_tokenRefreshState = _TokenRefreshStatus.expired;
			await _clearUserSessionAndNotifyCallback();
		} on DioError catch (e) {
			_tokenRefreshState = _TokenRefreshStatus.failed;
			_tokenRefreshDioError = e;
			handler.reject(e);
		}
	}

	Future _saveTokensAndRetryCurrentRequest(
		AuthTokens tokens,
		RequestOptions requestOptions,
		ErrorInterceptorHandler handler,
		) async {
		await authPreferences.setAuthTokens(tokens);

		// Unlock all requests.
		httpClient.unlock();

		// Update headers and retry the first failed request.
		requestOptions.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
		handler.resolve(await httpClient.fetch(requestOptions));
	}

	Future _clearUserSessionAndNotifyCallback() async {
		// Clear all requests in the queue and unlock client.
		httpClient
			..clear()
			..unlock();

		await authPreferences.clearAll();
		await userPreferences.clearAll();
		onTokenExpired();
	}

	/// RequestOptions is needed to get N-Meta information and base URL.
	Future<AuthTokens> _getNewTokens(RequestOptions requestOptions) async {
		try {
			final Map<String, dynamic> response = await refreshTokenHttpClient.get(
				'${requestOptions.baseUrl}v1/auth/token',
				headers: {
					'Authorization': 'Bearer ${authPreferences.refreshToken}',
					MetaInterceptor.nMetaHeaderKey:
					requestOptions.headers[MetaInterceptor.nMetaHeaderKey]
				},
			);
			return TokensResponse.fromJson(response['data']).getEntity();
		} on DioError catch (e) {
			if (e.response?.statusCode == 401) {
				throw const ResponseErrors.unauthorized();
			}
			rethrow;
		}
	}
}

enum _TokenRefreshStatus {
	/// Default state. No ongoing token-refresh operation.
	none,

	/// Some other error while refreshing token.
	failed,

	/// Token refresh returned 401.
	expired,

	/// Token refresh is in progress.
	inProgress,
}

extension _TokenStatus on _TokenRefreshStatus {
	bool get hasExpired => this == _TokenRefreshStatus.expired;

	bool get isInProgress => this == _TokenRefreshStatus.inProgress;

	bool get hasFailed => this == _TokenRefreshStatus.failed;
}