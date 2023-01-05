import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/exceptions/token_unauthorized_exception.dart';
import 'package:flutter_template/data/api/new/authenticator/authenticator.dart';
import 'package:flutter_template/data/api/new/interceptor/api_auth_interceptor.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:husl/data/preferences/auth_preferences.dart';
// import 'package:husl/domain/usecases/authorization/authorization_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

class MockAuthenticator extends Mock implements Authenticator {}

void main() {
  late Dio dio;
  late Authenticator _authenticator;
  late RequestInterceptorHandler requestHandler;
  late ErrorInterceptorHandler errorHandler;
  late ApiAuthInterceptor sut;

  const mockRequestHeaders = {'SomeHeader': 'SomeValue'};

  RequestOptions getMockOptions() {
    return RequestOptions(
      path: 'https://example.com/testing',
      headers: mockRequestHeaders,
    );
  }

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: 'example.com'));
    registerFallbackValue(DioError(requestOptions: getMockOptions()));
  });

  setUp(() {
    dio = MockDio();
    requestHandler = MockRequestHandler();
    errorHandler = MockErrorHandler();
    _authenticator = MockAuthenticator();

    sut = ApiAuthInterceptor(
      dio,
      _authenticator,
    );
  });

  final mockOptions = getMockOptions();

  final mockAuthTokens = AuthTokens(
    accessToken: 'accessToken',
    refreshToken: 'refreshToken',
    tokenType: 'tokenType',
    expiresIn: 19121999,
    expiresAt: DateTime.now(),
  );

  group('ApiInterceptor', () {
    group('When [onRequest] called', () {
      group('Token expires soon', () {
        group('and reauthentication throws exception', () {
          test('the handler must call [reject]', () async {
            final thrownException = Exception();

            when(() => _authenticator.expiresSoon).thenReturn(true);
            when(() => _authenticator.reauthenticate(any()))
                .thenThrow(thrownException);

            await sut.onRequest(mockOptions, requestHandler);

            verify(() => _authenticator.expiresSoon);
            verify(() => _authenticator.reauthenticate(mockOptions));
            verifyNever(() => _authenticator.accessToken);

            verifyNoMoreInteractions(_authenticator);
            verify(
              () => requestHandler.reject(
                captureAny(
                  that: predicate((error) {
                    if (error is! DioError) {
                      return false;
                    }

                    return error.error == thrownException &&
                        error.requestOptions == mockOptions;
                  }),
                ),
              ),
            );

            verifyNoMoreInteractions(requestHandler);
          });
        });

        test('must reauthenticaticate, set new header and continue execution',
            () async {
          when(() => _authenticator.expiresSoon).thenReturn(true);
          when(() => _authenticator.reauthenticate(any()))
              .thenAnswer((_) => Future.value(mockAuthTokens));
          when(() => _authenticator.accessToken)
              .thenReturn(mockAuthTokens.accessToken);

          await sut.onRequest(mockOptions, requestHandler);

          verify(() => _authenticator.expiresSoon);
          verify(() => _authenticator.reauthenticate(mockOptions));
          verify(() => _authenticator.accessToken);

          verifyNoMoreInteractions(_authenticator);

          verify(() => requestHandler.next(mockOptions));
          expect(
            mockOptions.headers['Authorization'],
            'Bearer ${_authenticator.accessToken}',
          );

          verifyNoMoreInteractions(requestHandler);
        });
      });
    });

    group('When [onError] called', () {
      group("and the error's status code is not 401", () {
        test('the handler must call [next]', () async {
          final dioError404 = DioError(
            requestOptions: mockOptions,
            response: Response(
              requestOptions: mockOptions,
              statusCode: 404,
            ),
          );

          final dioError500 = DioError(
            requestOptions: mockOptions,
            response: Response(
              requestOptions: mockOptions,
              statusCode: 404,
            ),
          );

          await sut.onError(dioError404, errorHandler);
          await sut.onError(dioError500, errorHandler);

          verify(() => errorHandler.next(dioError404));
          verify(() => errorHandler.next(dioError500));

          verifyNoMoreInteractions(_authenticator);
          verifyNoMoreInteractions(errorHandler);
        });
      });

      group("and the error's satus code is 401", () {
        group('and reauthentication throws', () {
          test('the handler must call next', () async {
            final reauthException = Exception();

            final dioError401 = DioError(
              requestOptions: mockOptions,
              response: Response(
                requestOptions: mockOptions,
                statusCode: 401,
              ),
            );

            when(() => _authenticator.reauthenticate(any()))
                .thenThrow(reauthException);

            await sut.onError(dioError401, errorHandler);

            verify(() => _authenticator.reauthenticate(mockOptions));

            verify(
              () => errorHandler.reject(
                captureAny(
                  that: predicate((error) {
                    return error is DioError &&
                        error.error == reauthException &&
                        error.requestOptions == mockOptions;
                  }),
                ),
              ),
            );

            verifyNoMoreInteractions(_authenticator);
            verifyNoMoreInteractions(errorHandler);
          });
        });

        group('and reauthentication works fine', () {
          group('when dio throws', () {
            group('and it throws a 401 error', () {
              test('the auth header must be set, the handler must call [next]',
                  () async {
                final retryDioError = DioError(
                  requestOptions: mockOptions,
                  response: Response(
                    requestOptions: mockOptions,
                    statusCode: 401,
                  ),
                );

                final initialDioError401 = DioError(
                  requestOptions: mockOptions,
                  response: Response(
                    requestOptions: mockOptions,
                    statusCode: 401,
                  ),
                );

                when(() => _authenticator.reauthenticate(any()))
                    .thenAnswer((_) async => mockAuthTokens);
                when(() => _authenticator.accessToken)
                    .thenReturn(mockAuthTokens.accessToken);
                when(() => dio.fetch(any())).thenThrow(retryDioError);

                await sut.onError(initialDioError401, errorHandler);

                verify(() => _authenticator.reauthenticate(mockOptions));
                verify(() => _authenticator.accessToken);
                verify(() => errorHandler.reject(
                      any(
                        that: predicate((error) {
                          return error is DioError &&
                              error.requestOptions == mockOptions &&
                              error.error == const TokenUnauthorizedException();
                        }),
                      ),
                    ));

                expect(
                  mockOptions.headers['Authorization'],
                  'Bearer ${mockAuthTokens.accessToken}',
                );

                verifyNoMoreInteractions(_authenticator);
                verifyNoMoreInteractions(errorHandler);
              });
            });

            group('and it throws a non 401 error', () {
              test(
                  "must reauthenticate, set the auth header, and call the handler's [next] method",
                  () async {
                final retryDioError = DioError(
                  requestOptions: mockOptions,
                  response: Response(
                    requestOptions: mockOptions,
                    statusCode: 500,
                  ),
                );

                final initialDioError401 = DioError(
                  requestOptions: mockOptions,
                  response: Response(
                    requestOptions: mockOptions,
                    statusCode: 401,
                  ),
                );

                when(() => _authenticator.reauthenticate(any()))
                    .thenAnswer((_) async => mockAuthTokens);
                when(() => _authenticator.accessToken)
                    .thenReturn(mockAuthTokens.accessToken);
                when(() => dio.fetch(any())).thenThrow(retryDioError);

                await sut.onError(initialDioError401, errorHandler);

                verify(() => _authenticator.reauthenticate(mockOptions));
                verify(() => _authenticator.accessToken);
                verify(() => errorHandler.next(retryDioError));
                expect(
                  mockOptions.headers['Authorization'],
                  'Bearer ${mockAuthTokens.accessToken}',
                );

                verifyNoMoreInteractions(_authenticator);
                verifyNoMoreInteractions(errorHandler);
              });
            });
          });

          group('when dio works fine', () {
            test(
                'must reauthenticate, set the auth header, the handler must [resolve]',
                () async {
              final retryResult = Response(requestOptions: mockOptions);

              final initialDioError401 = DioError(
                requestOptions: mockOptions,
                response: Response(
                  requestOptions: mockOptions,
                  statusCode: 401,
                ),
              );

              when(() => _authenticator.reauthenticate(any()))
                  .thenAnswer((_) async => mockAuthTokens);
              when(() => _authenticator.accessToken)
                  .thenReturn(mockAuthTokens.accessToken);
              when(() => dio.fetch(any())).thenAnswer((_) async => retryResult);

              await sut.onError(initialDioError401, errorHandler);

              verify(() => _authenticator.reauthenticate(mockOptions));
              verify(() => _authenticator.accessToken);
              verify(() => errorHandler.resolve(retryResult));
              expect(
                mockOptions.headers['Authorization'],
                'Bearer ${mockAuthTokens.accessToken}',
              );

              verifyNoMoreInteractions(_authenticator);
              verifyNoMoreInteractions(errorHandler);
            });
          });
        });
      });
    });
  });
}
