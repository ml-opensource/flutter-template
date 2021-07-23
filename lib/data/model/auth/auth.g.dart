// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth _$$_AuthFromJson(Map<String, dynamic> json) => _$_Auth(
      id: json['id'] as int,
      username: json['username'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'createdAt': instance.createdAt.toIso8601String(),
      'token': instance.token,
    };
