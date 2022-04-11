// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthTokensTearOff {
  const _$AuthTokensTearOff();

  _AuthTokens call(
      {required String accessToken,
      required String refreshToken,
      required String tokenType,
      required double expiresIn}) {
    return _AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
    );
  }
}

/// @nodoc
const $AuthTokens = _$AuthTokensTearOff();

/// @nodoc
mixin _$AuthTokens {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  double get expiresIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthTokensCopyWith<AuthTokens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokensCopyWith<$Res> {
  factory $AuthTokensCopyWith(
          AuthTokens value, $Res Function(AuthTokens) then) =
      _$AuthTokensCopyWithImpl<$Res>;
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      double expiresIn});
}

/// @nodoc
class _$AuthTokensCopyWithImpl<$Res> implements $AuthTokensCopyWith<$Res> {
  _$AuthTokensCopyWithImpl(this._value, this._then);

  final AuthTokens _value;
  // ignore: unused_field
  final $Res Function(AuthTokens) _then;

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
abstract class _$AuthTokensCopyWith<$Res> implements $AuthTokensCopyWith<$Res> {
  factory _$AuthTokensCopyWith(
          _AuthTokens value, $Res Function(_AuthTokens) then) =
      __$AuthTokensCopyWithImpl<$Res>;
  @override
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      double expiresIn});
}

/// @nodoc
class __$AuthTokensCopyWithImpl<$Res> extends _$AuthTokensCopyWithImpl<$Res>
    implements _$AuthTokensCopyWith<$Res> {
  __$AuthTokensCopyWithImpl(
      _AuthTokens _value, $Res Function(_AuthTokens) _then)
      : super(_value, (v) => _then(v as _AuthTokens));

  @override
  _AuthTokens get _value => super._value as _AuthTokens;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_AuthTokens(
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

class _$_AuthTokens extends _AuthTokens {
  const _$_AuthTokens(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.expiresIn})
      : super._();

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
    return 'AuthTokens(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthTokens &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.tokenType, tokenType) &&
            const DeepCollectionEquality().equals(other.expiresIn, expiresIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(tokenType),
      const DeepCollectionEquality().hash(expiresIn));

  @JsonKey(ignore: true)
  @override
  _$AuthTokensCopyWith<_AuthTokens> get copyWith =>
      __$AuthTokensCopyWithImpl<_AuthTokens>(this, _$identity);
}

abstract class _AuthTokens extends AuthTokens {
  const factory _AuthTokens(
      {required String accessToken,
      required String refreshToken,
      required String tokenType,
      required double expiresIn}) = _$_AuthTokens;
  const _AuthTokens._() : super._();

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get tokenType;
  @override
  double get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$AuthTokensCopyWith<_AuthTokens> get copyWith =>
      throw _privateConstructorUsedError;
}
