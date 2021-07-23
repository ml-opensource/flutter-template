// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
