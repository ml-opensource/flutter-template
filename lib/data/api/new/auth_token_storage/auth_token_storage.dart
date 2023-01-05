import 'package:flutter_template/data/model/auth/auth_tokens.dart';

/// A storage for authentication tokens.
abstract class AuthTokenStorage {
  Future<AuthTokens?> get();
  Future<void> set(AuthTokens tokens);

  Future<void> clear();
}
