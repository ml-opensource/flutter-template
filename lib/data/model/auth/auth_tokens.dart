import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';
part 'auth_tokens.g.dart';

@freezed
class AuthTokens with _$AuthTokens {
  const AuthTokens._();

  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required double expiresIn,
    required DateTime expiresAt,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);

  bool get hasValidAccessToken => accessToken.isNotEmpty;
  bool get hasValidRefreshToken => refreshToken.isNotEmpty;
  bool get expiresSoon {
    const minValidDifference = Duration(minutes: 1);

    final now = expiresAt.isUtc ? DateTime.now().toUtc() : DateTime.now();

    final lastValidTimestamp = now.subtract(minValidDifference);

    return expiresAt.isAfter(lastValidTimestamp);
  }
}
