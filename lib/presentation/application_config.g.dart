// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationConfig _$$_ApplicationConfigFromJson(Map<String, dynamic> json) =>
    _$_ApplicationConfig(
      apiUrl: json['apiUrl'] as String,
      flavor: $enumDecode(_$AppFlavorEnumMap, json['flavor']),
    );

Map<String, dynamic> _$$_ApplicationConfigToJson(
        _$_ApplicationConfig instance) =>
    <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'flavor': _$AppFlavorEnumMap[instance.flavor],
    };

const _$AppFlavorEnumMap = {
  AppFlavor.development: 'development',
  AppFlavor.staging: 'staging',
  AppFlavor.production: 'production',
};
