import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/data/response_objects/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_error.freezed.dart';

/// A representation of all possible errors while connecting with the
/// backend.
///
/// We return those errors to get localized messages to display to the user.
@freezed
sealed class ResponseError<T> with _$ResponseError<T> implements Exception {
  const ResponseError._();

  const factory ResponseError.noInternetConnection() = _NoInternetConnection;
  const factory ResponseError.sendTimeout() = _SendTimeout;
  const factory ResponseError.connectTimeout() = _ConnectTimeout;
  const factory ResponseError.receiveTimeout() = _ReceiveTimeout;
  const factory ResponseError.badRequest(ErrorName errorName) = _BadRequest;
  const factory ResponseError.notFound() = _NotFound;
  const factory ResponseError.tooManyRequests() = _TooManyRequests;
  const factory ResponseError.unprocessableEntity() = _UnprocessableEntity;
  const factory ResponseError.internalServerError() = _InternalServerError;
  const factory ResponseError.unexpectedError() = _UnexpectedError;
  const factory ResponseError.requestCancelled() = _RequestCancelled;
  const factory ResponseError.badCertificate() = _BedCertificate;
  const factory ResponseError.connectionError() = _ConnectionError;
  const factory ResponseError.conflict() = _Conflict;
  const factory ResponseError.unauthorized() = _Unauthorized;
  const factory ResponseError.invalidPassword() = _InvalidPasswordError;
  const factory ResponseError.invalidEmail() = _InvalidEmailError;
  const factory ResponseError.invalidLoginCredentials() =
      _InvalidLoginCredentials;
  const factory ResponseError.invalidSearchTerm() = _InvalidSearchTermError;

  static ResponseError from(Object error) {
    if (error is ResponseError) {
      return error;
    } else if (error is SocketException) {
      return const ResponseError.noInternetConnection();
    } else if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return const ResponseError.sendTimeout();
        case DioExceptionType.connectionTimeout:
          return const ResponseError.connectTimeout();
        case DioExceptionType.receiveTimeout:
          return const ResponseError.receiveTimeout();
        case DioExceptionType.unknown:
          return const ResponseError.noInternetConnection();
        case DioExceptionType.cancel:
          return const ResponseError.requestCancelled();
        case DioExceptionType.badCertificate:
          return const ResponseError.badCertificate();
        case DioExceptionType.connectionError:
          return const ResponseError.connectionError();
        case DioExceptionType.badResponse:
          switch (error.response!.statusCode) {
            case 400:
              return ErrorResponse.fromJson(error.response!.data)
                  .getResponseErrorType();
            // Returned when login credentials are invalid.
            case 401:
              return const ResponseError.unauthorized();
            case 404:
              return const ResponseError.notFound();
            case 409:
              return const ResponseError.conflict();
            case 422:
              return const ResponseError.unprocessableEntity();
            case 429:
              return const ResponseError.tooManyRequests();
            case 500:
            case 502:
              return const ResponseError.internalServerError();
            default:
              // If we receive a unexpected status code, we throw an exception.
              final statusCode = error.response!.statusCode;
              throw Exception('Received invalid status code: $statusCode');
          }
      }
    } else if (error is TypeError) {
      // TODO: Log it
    }
    return const ResponseError.unexpectedError();
  }
}

extension ResponseErrorExtensions on ResponseError {
  String getErrorMessage() {
    return when<String>(
      noInternetConnection: () => 'No Internet Connection',
      sendTimeout: () => 'Send Timeout Error',
      connectTimeout: () => 'Connection Timeout Error',
      receiveTimeout: () => 'Receive Timeout Error',
      badRequest: (message) => message.getErrorMessage(),
      notFound: () => 'Not Found Error',
      tooManyRequests: () => 'Too Many Requests',
      unprocessableEntity: () => 'Unprocessable Entity',
      internalServerError: () => 'Internal Server Error',
      unexpectedError: () => 'Unexpected Error',
      requestCancelled: () => 'Request Cancelled',
      conflict: () => 'Conflict Error',
      unauthorized: () => 'Unauthorized Error',
      invalidPassword: () => 'Invalid Password',
      invalidEmail: () => 'Invalid Email',
      invalidSearchTerm: () => 'Invalid Search Term',
      invalidLoginCredentials: () => 'Invalid Login Credentials',
      badCertificate: () => 'Bad Certificate',
      connectionError: () => 'Connection Error',
    );
  }
}
