// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokensResponse _$$_TokensResponseFromJson(Map<String, dynamic> json) =>
    _$_TokensResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TokensResponseToJson(_$_TokensResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
