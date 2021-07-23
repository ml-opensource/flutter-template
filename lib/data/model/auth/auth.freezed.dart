// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return _Auth.fromJson(json);
}

/// @nodoc
class _$AuthTearOff {
  const _$AuthTearOff();

  _Auth call(
      {required int id,
      required String username,
      required DateTime createdAt,
      required Token token}) {
    return _Auth(
      id: id,
      username: username,
      createdAt: createdAt,
      token: token,
    );
  }

  Auth fromJson(Map<String, Object> json) {
    return Auth.fromJson(json);
  }
}

/// @nodoc
const $Auth = _$AuthTearOff();

/// @nodoc
mixin _$Auth {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Token get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res>;
  $Res call({int id, String username, DateTime createdAt, Token token});

  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  final Auth _value;
  // ignore: unused_field
  final $Res Function(Auth) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? createdAt = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
    ));
  }

  @override
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc
abstract class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) then) =
      __$AuthCopyWithImpl<$Res>;
  @override
  $Res call({int id, String username, DateTime createdAt, Token token});

  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> extends _$AuthCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(_Auth _value, $Res Function(_Auth) _then)
      : super(_value, (v) => _then(v as _Auth));

  @override
  _Auth get _value => super._value as _Auth;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? createdAt = freezed,
    Object? token = freezed,
  }) {
    return _then(_Auth(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Auth implements _Auth {
  const _$_Auth(
      {required this.id,
      required this.username,
      required this.createdAt,
      required this.token});

  factory _$_Auth.fromJson(Map<String, dynamic> json) => _$$_AuthFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final DateTime createdAt;
  @override
  final Token token;

  @override
  String toString() {
    return 'Auth(id: $id, username: $username, createdAt: $createdAt, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Auth &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthToJson(this);
  }
}

abstract class _Auth implements Auth {
  const factory _Auth(
      {required int id,
      required String username,
      required DateTime createdAt,
      required Token token}) = _$_Auth;

  factory _Auth.fromJson(Map<String, dynamic> json) = _$_Auth.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  Token get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthCopyWith<_Auth> get copyWith => throw _privateConstructorUsedError;
}
