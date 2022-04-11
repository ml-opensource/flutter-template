// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_APIError _$$_APIErrorFromJson(Map<String, dynamic> json) => _$_APIError(
      requestId: json['requestId'] as String?,
      timestamp: json['timestamp'] as String?,
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      localizedMessage: json['localizedMessage'] as String,
      errorName: $enumDecode(_$ErrorNameEnumMap, json['errorName'],
          unknownValue: ErrorName.unknown),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$$_APIErrorToJson(_$_APIError instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'localizedMessage': instance.localizedMessage,
      'errorName': _$ErrorNameEnumMap[instance.errorName],
      'path': instance.path,
    };

const _$ErrorNameEnumMap = {
  ErrorName.errorExample: 'errorExample',
  ErrorName.unknown: 'unknown',
};

_$_ErrorResponse _$$_ErrorResponseFromJson(Map<String, dynamic> json) =>
    _$_ErrorResponse(
      error: APIError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ErrorResponseToJson(_$_ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
