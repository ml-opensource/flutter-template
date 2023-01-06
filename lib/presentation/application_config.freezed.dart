// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationConfig _$ApplicationConfigFromJson(Map<String, dynamic> json) {
  return _ApplicationConfig.fromJson(json);
}

/// @nodoc
mixin _$ApplicationConfig {
  String get apiUrl => throw _privateConstructorUsedError;
  AppFlavor get flavor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationConfigCopyWith<ApplicationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationConfigCopyWith<$Res> {
  factory $ApplicationConfigCopyWith(
          ApplicationConfig value, $Res Function(ApplicationConfig) then) =
      _$ApplicationConfigCopyWithImpl<$Res>;
  $Res call({String apiUrl, AppFlavor flavor});
}

/// @nodoc
class _$ApplicationConfigCopyWithImpl<$Res>
    implements $ApplicationConfigCopyWith<$Res> {
  _$ApplicationConfigCopyWithImpl(this._value, this._then);

  final ApplicationConfig _value;
  // ignore: unused_field
  final $Res Function(ApplicationConfig) _then;

  @override
  $Res call({
    Object? apiUrl = freezed,
    Object? flavor = freezed,
  }) {
    return _then(_value.copyWith(
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flavor: flavor == freezed
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as AppFlavor,
    ));
  }
}

/// @nodoc
abstract class _$ApplicationConfigCopyWith<$Res>
    implements $ApplicationConfigCopyWith<$Res> {
  factory _$ApplicationConfigCopyWith(
          _ApplicationConfig value, $Res Function(_ApplicationConfig) then) =
      __$ApplicationConfigCopyWithImpl<$Res>;
  @override
  $Res call({String apiUrl, AppFlavor flavor});
}

/// @nodoc
class __$ApplicationConfigCopyWithImpl<$Res>
    extends _$ApplicationConfigCopyWithImpl<$Res>
    implements _$ApplicationConfigCopyWith<$Res> {
  __$ApplicationConfigCopyWithImpl(
      _ApplicationConfig _value, $Res Function(_ApplicationConfig) _then)
      : super(_value, (v) => _then(v as _ApplicationConfig));

  @override
  _ApplicationConfig get _value => super._value as _ApplicationConfig;

  @override
  $Res call({
    Object? apiUrl = freezed,
    Object? flavor = freezed,
  }) {
    return _then(_ApplicationConfig(
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flavor: flavor == freezed
          ? _value.flavor
          : flavor // ignore: cast_nullable_to_non_nullable
              as AppFlavor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationConfig implements _ApplicationConfig {
  const _$_ApplicationConfig({required this.apiUrl, required this.flavor});

  factory _$_ApplicationConfig.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationConfigFromJson(json);

  @override
  final String apiUrl;
  @override
  final AppFlavor flavor;

  @override
  String toString() {
    return 'ApplicationConfig(apiUrl: $apiUrl, flavor: $flavor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApplicationConfig &&
            const DeepCollectionEquality().equals(other.apiUrl, apiUrl) &&
            const DeepCollectionEquality().equals(other.flavor, flavor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(apiUrl),
      const DeepCollectionEquality().hash(flavor));

  @JsonKey(ignore: true)
  @override
  _$ApplicationConfigCopyWith<_ApplicationConfig> get copyWith =>
      __$ApplicationConfigCopyWithImpl<_ApplicationConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationConfigToJson(this);
  }
}

abstract class _ApplicationConfig implements ApplicationConfig {
  const factory _ApplicationConfig(
      {required final String apiUrl,
      required final AppFlavor flavor}) = _$_ApplicationConfig;

  factory _ApplicationConfig.fromJson(Map<String, dynamic> json) =
      _$_ApplicationConfig.fromJson;

  @override
  String get apiUrl => throw _privateConstructorUsedError;
  @override
  AppFlavor get flavor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationConfigCopyWith<_ApplicationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
