import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/data/api/auth_token_storage/auth_token_storage.dart';
import 'package:flutter_template/data/model/auth/auth_tokens.dart';
import 'package:injectable/injectable.dart';

/// A storage for auth tokens that uses [FlutterSecureStorage].
@LazySingleton(as: AuthTokenStorage)
class SecureAuthTokenStorage extends AuthTokenStorage {
  SecureAuthTokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  @visibleForTesting
  static const String tokenKey = 'auth_token';

  @override
  Future<AuthTokens?> get() async {
    final json = await _storage.read(key: tokenKey);

    if (json == null) {
      return null;
    }

    final map = jsonDecode(json) as Map<String, dynamic>;

    return AuthTokens.fromJson(map);
  }

  @override
  Future<void> set(AuthTokens tokens) {
    final json = jsonEncode(tokens.toJson());
    return _storage.write(key: tokenKey, value: json);
  }

  @override
  Future<void> clear() {
    return _storage.delete(key: tokenKey);
  }
}
