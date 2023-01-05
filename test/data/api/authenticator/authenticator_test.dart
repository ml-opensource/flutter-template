import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/api_config.dart';
import 'package:flutter_template/data/api/exceptions/authenticator_exception.dart';
import 'package:flutter_template/data/api/new/auth_token_storage/auth_token_storage.dart';
import 'package:flutter_template/data/api/new/authenticator/authenticator.dart';
import 'package:flutter_template/data/interceptor/meta_interceptor.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_template/data/services/http_client/dio_http_client.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/application_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthTokenStorage extends Mock implements AuthTokenStorage {}

class MockDioHttpClient extends Mock implements DioHttpClient {}

void main() {
  final mockApiConfig = ApiConfig(
    const ApplicationConfig(
      apiUrl: 'https://example.com',
      flavor: AppFlavor.development,
    ),
  );

  final mockTokens = AuthTokens(
    accessToken: 'accessToken',
    refreshToken: 'refreshToken',
    tokenType: 'tokenType',
    expiresIn: 10,
    expiresAt: DateTime.now(),
  );

  late AuthTokenStorage storage;
  late DioHttpClient client;
  late Authenticator sut;
  late var apiConfig = mockApiConfig;

  final tokenRefreshEndpoint = '${apiConfig.apiUrl}/v1/auth/token';

  setUpAll(() {
    registerFallbackValue(mockTokens);
  });

  setUp(() {
    storage = MockAuthTokenStorage();
    client = MockDioHttpClient();

    sut = Authenticator(
      storage,
      client,
      apiConfig,
    );
  });

  group(
    'Authenticator',
    () {
      group('when accessing the [accessToken] getter', () {
        group('and the token is not restored', () {
          test(
            'Must return null',
            () async {
              expect(sut.accessToken, null);
            },
          );
        });

        group('and the token is restored', () {
          setUp(() async {
            storage = MockAuthTokenStorage();
            apiConfig = mockApiConfig;
            client = MockDioHttpClient();

            when(
              () => storage.get(),
            ).thenAnswer((_) async => mockTokens);

            sut = await Authenticator.restore(
              storage,
              client,
              apiConfig,
            );
          });

          test('Must return a valid token', () {
            expect(sut.accessToken, mockTokens.accessToken);
          });
        });
      });

      group('when accessing the [refreshToken] getter', () {
        group('and the token is not restored', () {
          test('Must return null', () async {
            expect(sut.refreshToken, null);
          });
        });

        group('and the token is restored', () {
          setUp(() async {
            storage = MockAuthTokenStorage();
            apiConfig = mockApiConfig;
            client = MockDioHttpClient();

            when(
              () => storage.get(),
            ).thenAnswer((_) async => mockTokens);

            sut = await Authenticator.restore(
              storage,
              client,
              apiConfig,
            );
          });

          test('Must return a valid token', () {
            expect(sut.refreshToken, mockTokens.refreshToken);
          });
        });
      });

      group('when accessing the [expiresSoon] getter', () {
        group('and the token is not restored', () {
          test('Must return true', () async {
            expect(sut.expiresSoon, true);
          });
        });

        group('and the token is restored', () {
          setUp(() async {
            storage = MockAuthTokenStorage();
            apiConfig = mockApiConfig;
            client = MockDioHttpClient();

            when(
              () => storage.get(),
            ).thenAnswer((_) async => mockTokens);

            sut = await Authenticator.restore(
              storage,
              client,
              apiConfig,
            );
          });

          test('Must return a valid expires soon value', () {
            expect(sut.expiresSoon, mockTokens.expiresSoon);
          });
        });
      });

      group('when [reauthenticate] is called', () {
        group('and the token is not restored', () {
          test('Must throw an [AuthenticatorException.noRefreshToken]',
              () async {
            when(() => storage.clear()).thenAnswer((_) => Future.value());

            expect(
              () => sut.reauthenticate(
                RequestOptions(path: apiConfig.apiUrl),
              ),
              throwsA(const AuthenticatorException.noRefreshToken()),
            );

            await untilCalled(() => storage.clear());

            verify(() => storage.clear());

            verifyNoMoreInteractions(storage);
            verifyNoMoreInteractions(client);
          });
        });

        group('and the token is restored', () {
          setUp(
            () async {
              storage = MockAuthTokenStorage();
              apiConfig = mockApiConfig;
              client = MockDioHttpClient();

              when(
                () => storage.get(),
              ).thenAnswer((_) async => mockTokens);

              sut = await Authenticator.restore(
                storage,
                client,
                apiConfig,
              );
            },
          );

          group('and [_refreshTokenClient] throws an exception', () {
            test(
                'Must throw a [AuthenticatorException.unauthorized()] if the status code is 401',
                () {
              final mockRequestOptions = RequestOptions(
                path: '${apiConfig.apiUrl}/some/endpoint',
                headers: {MetaInterceptor.nMetaHeaderKey: 'SomeHeader'},
              );

              final dioError = DioError(
                requestOptions: mockRequestOptions,
                response: Response(
                  requestOptions: mockRequestOptions,
                  statusCode: 401,
                ),
                error: Exception(),
              );

              final refreshToken = sut.refreshToken;

              when(() => client.get<Map<String, dynamic>>(
                    any(),
                    headers: any(named: 'headers'),
                  )).thenThrow(dioError);
              when(() => storage.clear()).thenAnswer((_) => Future.value());

              expect(
                () => sut.reauthenticate(mockRequestOptions),
                throwsA(const AuthenticatorException.unauthorized()),
              );

              verify(
                () => client
                    .get<Map<String, dynamic>>(tokenRefreshEndpoint, headers: {
                  'Authorization': 'Bearer $refreshToken',
                  MetaInterceptor.nMetaHeaderKey:
                      mockRequestOptions.headers[MetaInterceptor.nMetaHeaderKey]
                }),
              );

              expect(sut.accessToken, isNull);
              expect(sut.refreshToken, isNull);

              verify(() => storage.clear());

              // Called during restoring.
              verify(() => storage.get());

              verifyNoMoreInteractions(storage);
              verifyNoMoreInteractions(client);
            });
            test('Must rethrow when the status code is not 401', () {
              final mockRequestOptions = RequestOptions(
                path: '${apiConfig.apiUrl}/some/endpoint',
                headers: {MetaInterceptor.nMetaHeaderKey: 'SomeHeader'},
              );

              final dioError = DioError(
                requestOptions: mockRequestOptions,
                response: Response(
                  requestOptions: mockRequestOptions,
                  statusCode: 400,
                ),
                error: Exception(),
              );

              when(() => client.get<Map<String, dynamic>>(
                    any(),
                    headers: any(named: 'headers'),
                  )).thenThrow(dioError);

              expect(
                () => sut.reauthenticate(mockRequestOptions),
                throwsA(dioError),
              );

              verify(
                () => client.get<Map<String, dynamic>>(
                  tokenRefreshEndpoint,
                  headers: {
                    'Authorization': 'Bearer ${sut.refreshToken}',
                    MetaInterceptor.nMetaHeaderKey: mockRequestOptions
                        .headers[MetaInterceptor.nMetaHeaderKey]
                  },
                ),
              );

              // Called during restoring.
              verify(() => storage.get());

              verifyNoMoreInteractions(storage);
              verifyNoMoreInteractions(client);
            });
          });

          group('and [_refreshTokenClient] returns a null response', () {
            test(
                'Must throw an [AuthenticatorException.reauthenticationFailed], clear the vault and notify',
                () async {
              final mockRequestOptions = RequestOptions(
                path: '${apiConfig.apiUrl}/some/endpoint',
                headers: {MetaInterceptor.nMetaHeaderKey: 'SomeHeader'},
              );

              final refreshToken = sut.refreshToken;

              when(() => client.get<Map<String, dynamic>>(
                    any(),
                    headers: any(named: 'headers'),
                  )).thenAnswer((_) async => null);
              when(() => storage.clear()).thenAnswer((_) => Future.value());

              unawaited(expectLater(sut.onUnauthenticated, emits(anything)));

              expect(
                () => sut.reauthenticate(mockRequestOptions),
                throwsA(const AuthenticatorException.reauthenticationFailed()),
              );

              await untilCalled(() => storage.clear());

              verify(
                () => client.get<Map<String, dynamic>>(
                  tokenRefreshEndpoint,
                  headers: {
                    'Authorization': 'Bearer $refreshToken',
                    MetaInterceptor.nMetaHeaderKey: mockRequestOptions
                        .headers[MetaInterceptor.nMetaHeaderKey]
                  },
                ),
              );
              verify(() => storage.clear());
              // Called during restoring.
              verify(() => storage.get());

              verifyNoMoreInteractions(storage);
              verifyNoMoreInteractions(client);
            });
          });

          group('and [_refreshTokenClient] returns a valid response', () {
            test('Must return a valid token', () async {
              final mockRequestOptions = RequestOptions(
                path: '${apiConfig.apiUrl}/some/endpoint',
                headers: {MetaInterceptor.nMetaHeaderKey: 'SomeHeader'},
              );

              when(() => client.get<Map<String, dynamic>>(
                    any(),
                    headers: any(named: 'headers'),
                  )).thenAnswer((_) async => {'data': mockTokens.toJson()});

              when(() => storage.set(any()))
                  .thenAnswer((invocation) => Future.value());

              final result = await sut.reauthenticate(mockRequestOptions);

              // Is needed because we set expires at when returning an entity
              final expectedToken =
                  mockTokens.copyWith(expiresAt: result.expiresAt);

              expect(
                result,
                expectedToken,
              );

              verify(
                () => client.get<Map<String, dynamic>>(
                  tokenRefreshEndpoint,
                  headers: {
                    'Authorization': 'Bearer ${sut.refreshToken}',
                    MetaInterceptor.nMetaHeaderKey: mockRequestOptions
                        .headers[MetaInterceptor.nMetaHeaderKey]
                  },
                ),
              );
              verify(() => storage.set(expectedToken));

              // Called during restoring.
              verify(() => storage.get());

              verifyNoMoreInteractions(client);
              verifyNoMoreInteractions(storage);
            });
          });
        });
      });

      group('when [clear] called', () {
        setUp(() async {
          storage = MockAuthTokenStorage();
          apiConfig = mockApiConfig;
          client = MockDioHttpClient();

          when(
            () => storage.get(),
          ).thenAnswer((_) async => mockTokens);

          sut = await Authenticator.restore(
            storage,
            client,
            apiConfig,
          );
        });

        test('must clear the storage and nullify the token', () async {
          when(() => storage.clear()).thenAnswer((_) => Future.value());

          await sut.clear();

          expect(sut.refreshToken, isNull);
          expect(sut.accessToken, isNull);

          // Called during restoring
          verify(() => storage.get());
          verify(() => storage.clear());
          verifyNoMoreInteractions(storage);
        });
      });

      group('when [setNewTokens] called', () {
        test('must set new tokens and store them in the storage', () async {
          when(() => storage.set(any())).thenAnswer((_) => Future.value());

          await sut.setNewTokens(mockTokens);

          expect(sut.refreshToken, mockTokens.refreshToken);
          expect(sut.accessToken, mockTokens.accessToken);

          verify(() => storage.set(mockTokens));
          verifyNoMoreInteractions(storage);
        });
      });
    },
  );
}
