// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tokens_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokensResponse _$TokensResponseFromJson(Map<String, dynamic> json) {
  return _TokensResponse.fromJson(json);
}

/// @nodoc
class _$TokensResponseTearOff {
  const _$TokensResponseTearOff();

  _TokensResponse call(
      {required String accessToken,
      required String refreshToken,
      required String tokenType,
      required double expiresIn}) {
    return _TokensResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
    );
  }

  TokensResponse fromJson(Map<String, Object> json) {
    return TokensResponse.fromJson(json);
  }
}

/// @nodoc
const $TokensResponse = _$TokensResponseTearOff();

/// @nodoc
mixin _$TokensResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  double get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensResponseCopyWith<TokensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensResponseCopyWith<$Res> {
  factory $TokensResponseCopyWith(
          TokensResponse value, $Res Function(TokensResponse) then) =
      _$TokensResponseCopyWithImpl<$Res>;
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      double expiresIn});
}

/// @nodoc
class _$TokensResponseCopyWithImpl<$Res>
    implements $TokensResponseCopyWith<$Res> {
  _$TokensResponseCopyWithImpl(this._value, this._then);

  final TokensResponse _value;
  // ignore: unused_field
  final $Res Function(TokensResponse) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TokensResponseCopyWith<$Res>
    implements $TokensResponseCopyWith<$Res> {
  factory _$TokensResponseCopyWith(
          _TokensResponse value, $Res Function(_TokensResponse) then) =
      __$TokensResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      double expiresIn});
}

/// @nodoc
class __$TokensResponseCopyWithImpl<$Res>
    extends _$TokensResponseCopyWithImpl<$Res>
    implements _$TokensResponseCopyWith<$Res> {
  __$TokensResponseCopyWithImpl(
      _TokensResponse _value, $Res Function(_TokensResponse) _then)
      : super(_value, (v) => _then(v as _TokensResponse));

  @override
  _TokensResponse get _value => super._value as _TokensResponse;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_TokensResponse(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokensResponse extends _TokensResponse {
  const _$_TokensResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.expiresIn})
      : super._();

  factory _$_TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TokensResponseFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String tokenType;
  @override
  final double expiresIn;

  @override
  String toString() {
    return 'TokensResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TokensResponse &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn);

  @JsonKey(ignore: true)
  @override
  _$TokensResponseCopyWith<_TokensResponse> get copyWith =>
      __$TokensResponseCopyWithImpl<_TokensResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokensResponseToJson(this);
  }
}

abstract class _TokensResponse extends TokensResponse {
  const factory _TokensResponse(
      {required String accessToken,
      required String refreshToken,
      required String tokenType,
      required double expiresIn}) = _$_TokensResponse;
  const _TokensResponse._() : super._();

  factory _TokensResponse.fromJson(Map<String, dynamic> json) =
      _$_TokensResponse.fromJson;

  @override
  String get accessToken => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  String get tokenType => throw _privateConstructorUsedError;
  @override
  double get expiresIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TokensResponseCopyWith<_TokensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
