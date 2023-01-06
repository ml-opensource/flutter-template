// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authenticator_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticatorException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() noRefreshToken,
    required TResult Function() reauthenticationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NoRefreshToken value) noRefreshToken,
    required TResult Function(_ReauthenticationFailed value)
        reauthenticationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorExceptionCopyWith<$Res> {
  factory $AuthenticatorExceptionCopyWith(AuthenticatorException value,
          $Res Function(AuthenticatorException) then) =
      _$AuthenticatorExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatorExceptionCopyWithImpl<$Res>
    implements $AuthenticatorExceptionCopyWith<$Res> {
  _$AuthenticatorExceptionCopyWithImpl(this._value, this._then);

  final AuthenticatorException _value;
  // ignore: unused_field
  final $Res Function(AuthenticatorException) _then;
}

/// @nodoc
abstract class _$UnauthorizedCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(
          _Unauthorized value, $Res Function(_Unauthorized) then) =
      __$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    extends _$AuthenticatorExceptionCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(
      _Unauthorized _value, $Res Function(_Unauthorized) _then)
      : super(_value, (v) => _then(v as _Unauthorized));

  @override
  _Unauthorized get _value => super._value as _Unauthorized;
}

/// @nodoc

class _$_Unauthorized implements _Unauthorized {
  const _$_Unauthorized();

  @override
  String toString() {
    return 'AuthenticatorException.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() noRefreshToken,
    required TResult Function() reauthenticationFailed,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NoRefreshToken value) noRefreshToken,
    required TResult Function(_ReauthenticationFailed value)
        reauthenticationFailed,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements AuthenticatorException {
  const factory _Unauthorized() = _$_Unauthorized;
}

/// @nodoc
abstract class _$NoRefreshTokenCopyWith<$Res> {
  factory _$NoRefreshTokenCopyWith(
          _NoRefreshToken value, $Res Function(_NoRefreshToken) then) =
      __$NoRefreshTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoRefreshTokenCopyWithImpl<$Res>
    extends _$AuthenticatorExceptionCopyWithImpl<$Res>
    implements _$NoRefreshTokenCopyWith<$Res> {
  __$NoRefreshTokenCopyWithImpl(
      _NoRefreshToken _value, $Res Function(_NoRefreshToken) _then)
      : super(_value, (v) => _then(v as _NoRefreshToken));

  @override
  _NoRefreshToken get _value => super._value as _NoRefreshToken;
}

/// @nodoc

class _$_NoRefreshToken implements _NoRefreshToken {
  const _$_NoRefreshToken();

  @override
  String toString() {
    return 'AuthenticatorException.noRefreshToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoRefreshToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() noRefreshToken,
    required TResult Function() reauthenticationFailed,
  }) {
    return noRefreshToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
  }) {
    return noRefreshToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (noRefreshToken != null) {
      return noRefreshToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NoRefreshToken value) noRefreshToken,
    required TResult Function(_ReauthenticationFailed value)
        reauthenticationFailed,
  }) {
    return noRefreshToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
  }) {
    return noRefreshToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (noRefreshToken != null) {
      return noRefreshToken(this);
    }
    return orElse();
  }
}

abstract class _NoRefreshToken implements AuthenticatorException {
  const factory _NoRefreshToken() = _$_NoRefreshToken;
}

/// @nodoc
abstract class _$ReauthenticationFailedCopyWith<$Res> {
  factory _$ReauthenticationFailedCopyWith(_ReauthenticationFailed value,
          $Res Function(_ReauthenticationFailed) then) =
      __$ReauthenticationFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReauthenticationFailedCopyWithImpl<$Res>
    extends _$AuthenticatorExceptionCopyWithImpl<$Res>
    implements _$ReauthenticationFailedCopyWith<$Res> {
  __$ReauthenticationFailedCopyWithImpl(_ReauthenticationFailed _value,
      $Res Function(_ReauthenticationFailed) _then)
      : super(_value, (v) => _then(v as _ReauthenticationFailed));

  @override
  _ReauthenticationFailed get _value => super._value as _ReauthenticationFailed;
}

/// @nodoc

class _$_ReauthenticationFailed implements _ReauthenticationFailed {
  const _$_ReauthenticationFailed();

  @override
  String toString() {
    return 'AuthenticatorException.reauthenticationFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ReauthenticationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() noRefreshToken,
    required TResult Function() reauthenticationFailed,
  }) {
    return reauthenticationFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
  }) {
    return reauthenticationFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? noRefreshToken,
    TResult Function()? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (reauthenticationFailed != null) {
      return reauthenticationFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NoRefreshToken value) noRefreshToken,
    required TResult Function(_ReauthenticationFailed value)
        reauthenticationFailed,
  }) {
    return reauthenticationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
  }) {
    return reauthenticationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NoRefreshToken value)? noRefreshToken,
    TResult Function(_ReauthenticationFailed value)? reauthenticationFailed,
    required TResult orElse(),
  }) {
    if (reauthenticationFailed != null) {
      return reauthenticationFailed(this);
    }
    return orElse();
  }
}

abstract class _ReauthenticationFailed implements AuthenticatorException {
  const factory _ReauthenticationFailed() = _$_ReauthenticationFailed;
}
