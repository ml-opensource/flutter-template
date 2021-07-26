import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_errors.freezed.dart';

/// A representation of all possible errors while connecting with the
/// backend.
///
/// We return those errors to get localized messages to display to the user.
@freezed
class ResponseErrors<T> with _$ResponseErrors<T> implements Error {
	const ResponseErrors._();
	const factory ResponseErrors.noInternetConnection() = _NoInternetConnection;
	const factory ResponseErrors.sendTimeout() = _SendTimeout;
	const factory ResponseErrors.connectTimeout() = _ConnectTimeout;
	const factory ResponseErrors.receiveTimeout() = _ReceiveTimeout;
	const factory ResponseErrors.badRequest() = _BadRequest;
	const factory ResponseErrors.notFound() = _NotFound;
	const factory ResponseErrors.tooManyRequests() = _TooManyRequests;
	const factory ResponseErrors.unprocessableEntity() = _UnprocessableEntity;
	const factory ResponseErrors.internalServerError() = _InternalServerError;
	const factory ResponseErrors.unexpectedError() = _UnexpectedError;
	const factory ResponseErrors.requestCancelled() = _RequestCancelled;
	const factory ResponseErrors.conflict() = _Conflict;
	const factory ResponseErrors.unauthorized() = _Unauthorized;
	const factory ResponseErrors.invalidPassword() = InvalidPasswordError;
	const factory ResponseErrors.invalidEmail() = InvalidEmailError;
	const factory ResponseErrors.invalidLoginCredentials() =
	_InvalidLoginCredentials;
	const factory ResponseErrors.invalidSearhTerm() = InvalidSearchTermError;

	@override
	StackTrace? get stackTrace => StackTrace.fromString(toString());

	static ResponseErrors fromDioError(Object error) {
		if (error is ResponseErrors) {
			return error;
		} else if (error is SocketException) {
			return const ResponseErrors.noInternetConnection();
		} else if (error is DioError) {
			switch (error.type) {
				case DioErrorType.sendTimeout:
					return const ResponseErrors.sendTimeout();
				case DioErrorType.connectTimeout:
					return const ResponseErrors.connectTimeout();
				case DioErrorType.receiveTimeout:
					return const ResponseErrors.receiveTimeout();
				case DioErrorType.other:
					return const ResponseErrors.noInternetConnection();
				case DioErrorType.cancel:
					return const ResponseErrors.requestCancelled();
				case DioErrorType.response:
					switch (error.response!.statusCode) {
						case 400:
							return const ResponseErrors.badRequest();
					// Returned when login credentials are invalid.
						case 401:
							return const ResponseErrors.unauthorized();
						case 404:
							return const ResponseErrors.notFound();
						case 409:
							return const ResponseErrors.conflict();
						case 422:
							return const ResponseErrors.unprocessableEntity();
						case 429:
							return const ResponseErrors.tooManyRequests();
						case 500:
						case 502:
							return const ResponseErrors.internalServerError();
						default:
						// If we receive a unexpected status code, we throw an exception.
							final statusCode = error.response!.statusCode;
							throw Exception('Received invalid status code: $statusCode');
					}
			}
		} else if (error is TypeError) {
			debugPrint(error.toString());
		}
		return const ResponseErrors.unexpectedError();
	}
}