import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/data/api/new/auth_token_storage/secure_auth_token_storage.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late FlutterSecureStorage storage;
  late SecureAuthTokenStorage sut;

  setUp(() {
    storage = MockFlutterSecureStorage();

    sut = SecureAuthTokenStorage(storage);
  });

  group(
    'SecureAuthTokenStorage',
    () {
      group(
        'when [get] called',
        () {
          group(
            'and no token stored',
            () {
              test(
                'Must return null',
                () async {
                  when(() => storage.read(key: SecureAuthTokenStorage.tokenKey))
                      .thenAnswer((invocation) async => null);

                  final result = await sut.get();

                  verify(
                    () => storage.read(key: SecureAuthTokenStorage.tokenKey),
                  );

                  verifyNoMoreInteractions(storage);

                  expect(result, null);
                },
              );
            },
          );

          group(
            'and a token is stored',
            () {
              test(
                'Must return valid token',
                () async {
                  final mockTokens = AuthTokens(
                    accessToken: 'accessToken',
                    refreshToken: 'refreshToken',
                    tokenType: 'tokenType',
                    expiresIn: 10,
                    expiresAt: DateTime.now(),
                  );

                  final storedToken = jsonEncode(mockTokens.toJson());

                  when(() => storage.read(key: SecureAuthTokenStorage.tokenKey))
                      .thenAnswer((invocation) async => storedToken);

                  final result = await sut.get();

                  verify(
                    () => storage.read(key: SecureAuthTokenStorage.tokenKey),
                  );

                  verifyNoMoreInteractions(storage);

                  expect(result, mockTokens);
                },
              );

              test(
                'Must throw a FormatException if token is invalid',
                () async {
                  const storedToken = 'invalid';

                  when(() => storage.read(key: SecureAuthTokenStorage.tokenKey))
                      .thenAnswer((invocation) async => storedToken);

                  expect(
                    () => sut.get(),
                    throwsFormatException,
                  );

                  verify(
                    () => storage.read(key: SecureAuthTokenStorage.tokenKey),
                  );

                  verifyNoMoreInteractions(storage);
                },
              );
            },
          );
        },
      );

      group(
        'when [set] called',
        () {
          test(
            'Must store the token in a valid format',
            () async {
              final mockTokens = AuthTokens(
                accessToken: 'accessToken',
                refreshToken: 'refreshToken',
                tokenType: 'tokenType',
                expiresIn: 10,
                expiresAt: DateTime.now(),
              );

              final expectedTokenToStore = jsonEncode(mockTokens.toJson());

              when(() => storage.write(
                    key: SecureAuthTokenStorage.tokenKey,
                    value: any(named: 'value'),
                  )).thenAnswer((_) => Future.value());

              await sut.set(mockTokens);

              verify(
                () => storage.write(
                  key: SecureAuthTokenStorage.tokenKey,
                  value: expectedTokenToStore,
                ),
              );

              verifyNoMoreInteractions(storage);
            },
          );
        },
      );

      group(
        'When [clear] called',
        () {
          test(
            'Must remove the token',
            () async {
              when(() => storage.delete(
                    key: any(named: 'key'),
                  )).thenAnswer((_) => Future.value());

              await sut.clear();

              verify(
                () => storage.delete(
                  key: SecureAuthTokenStorage.tokenKey,
                ),
              );

              verifyNoMoreInteractions(storage);
            },
          );
        },
      );
    },
  );
}
