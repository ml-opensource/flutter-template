import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/data/response_objects/error_response.dart';
import 'package:flutter_template/nstack/nstack.dart';
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
  const factory ResponseError.invalidSearhTerm() = _InvalidSearchTermError;

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
  String getErrorMessage(Localization l10n) {
    //TODO: create error module for errors and set value accordingly
    return when<String>(
      noInternetConnection: () => l10n.error.connectionError,
      sendTimeout: () => l10n.error.authenticationError,
      connectTimeout: () => l10n.error.authenticationError,
      receiveTimeout: () => l10n.error.authenticationError,
      badRequest: (message) => message.getErrorMessage(l10n),
      notFound: () => l10n.error.authenticationError,
      tooManyRequests: () => l10n.error.authenticationError,
      unprocessableEntity: () => l10n.error.authenticationError,
      internalServerError: () => l10n.error.authenticationError,
      unexpectedError: () => l10n.error.authenticationError,
      requestCancelled: () => l10n.error.authenticationError,
      conflict: () => l10n.error.authenticationError,
      unauthorized: () => l10n.error.authenticationError,
      invalidPassword: () => l10n.error.authenticationError,
      invalidEmail: () => l10n.error.authenticationError,
      invalidSearhTerm: () => l10n.error.authenticationError,
      invalidLoginCredentials: () => l10n.error.authenticationError,
      badCertificate: () => l10n.error.authenticationError,
      connectionError: () => l10n.error.connectionError,
    );
  }
}
