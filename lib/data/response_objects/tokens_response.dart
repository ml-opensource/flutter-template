import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_response.freezed.dart';
part 'tokens_response.g.dart';

// ignore: non_constant_identifier_names
@freezed
class TokensResponse with _$TokensResponse {
  const TokensResponse._();

  const factory TokensResponse({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required double expiresIn,
  }) = _TokensResponse;

  @visibleForTesting
  factory TokensResponse.mock() {
    return TokensResponse.fromJson({
      'accessToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwY2MiO',
      'refreshToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwY2Mi',
      'tokenType': 'Bearer',
      'expiresIn': 2592000,
    });
  }

  factory TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseFromJson(json);

  AuthTokens getEntity() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
    );
  }
}
