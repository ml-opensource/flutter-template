import 'dart:convert';

import 'package:flutter_template/data/model/auth/auth.dart';
import 'package:flutter_template/data/model/auth/auth_status.dart';
import 'package:flutter_template/data/model/auth/token.dart';
import 'package:flutter_template/data/repository/auth_storage_repository.dart';
import 'package:prefs/prefs.dart';
import 'package:rxdart/rxdart.dart';

class AuthStorageRepositoryImpl implements AuthStorageRepository {
  static const authStatusKey = 'authStatusKey';
  static const tokenKey = 'tokenKey';

  final BehaviorSubject<AuthStatus> items = BehaviorSubject();

  AuthStorageRepositoryImpl() {
    Prefs.init();
  }

  @override
  Future<void> setAuthStatus(AuthStatus status) async {
    Prefs.setInt(authStatusKey, status.index);
    items.add(AuthStatus.values[Prefs.getInt(authStatusKey)]);
  }

  @override
  Future<AuthStatus> getAuthStatus() async {
    return AuthStatus.values[Prefs.getInt(authStatusKey)];
  }

  @override
  Future<Stream<AuthStatus>> getAuthStatusStream() async {
    return items.stream;
  }

  @override
  Future<void> setToken(Token token) async {
    await Prefs.setString(tokenKey, jsonEncode(token.toJson()));
  }

  @override
  Future<Token> getToken() async {
    return Token.fromJson(jsonDecode(Prefs.getString(tokenKey, "")));
  }

  @override
  Future<Auth> refreshToken(Token token) {
    throw UnsupportedError('Not supported via storage.');
  }

  @override
  Future<void> clear() async {
    Prefs.remove(tokenKey);
    Prefs.remove(authStatusKey);
  }
}
