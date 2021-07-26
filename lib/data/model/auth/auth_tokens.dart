import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

@freezed
class AuthTokens with _$AuthTokens {
  const AuthTokens._();

  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required double expiresIn,
  }) = _AuthTokens;

  bool get hasValidAccessToken => accessToken.isNotEmpty;

  bool get hasValidRefreshToken => refreshToken.isNotEmpty;
}
