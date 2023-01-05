import 'package:flutter_template/data/model/auth/auth_tokens.dart';

/// A storage for authentication tokens.
abstract class AuthTokenStorage {
  // Future<String?> get accessToken;
  // Future<String?> get refreshToken;
  // Future<double?> get tokenExpiryTime;

  // Future<bool> hasValidAccessToken();

  // Future setAccessToken(String token);
  // Future setRefreshToken(String token);
  // Future setRefreshTokenExpiry(double expiresIn);

  Future<AuthTokens?> get();
  Future<void> set(AuthTokens tokens);

  Future<void> clear();
}
