import 'dart:convert';

import 'package:flutter_template/data/model/auth/jwt_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String accessToken,
    required String tokenType,
    required int expiresIn, // Duration in seconds
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

extension TokenExtensions on Token {
  JwtToken get jwtToken {
    final parts = this.accessToken.split('.');
    final payload = parts[1];
    final String jsonData = B64urlEncRfc7515.decodeUtf8(payload);
    final decoded = json.decode(jsonData);
    return JwtToken.fromJson(decoded);
  }

  bool get isExpiring {
    final expiresAt = DateTime.fromMillisecondsSinceEpoch(jwtToken.exp * 1000);
    return expiresAt.difference(DateTime.now()) < Duration(days: 1);
  }

  bool get isExpired {
    final expiresAt = DateTime.fromMillisecondsSinceEpoch(jwtToken.exp * 1000);
    return expiresAt.difference(DateTime.now()) <= Duration(seconds: 1);
  }
}
