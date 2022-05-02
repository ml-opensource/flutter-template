// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

APIError _$APIErrorFromJson(Map<String, dynamic> json) {
  return _APIError.fromJson(json);
}

/// @nodoc
mixin _$APIError {
  String? get requestId => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get localizedMessage => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: ErrorName.unknown)
  ErrorName get errorName => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $APIErrorCopyWith<APIError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIErrorCopyWith<$Res> {
  factory $APIErrorCopyWith(APIError value, $Res Function(APIError) then) =
      _$APIErrorCopyWithImpl<$Res>;
  $Res call(
      {String? requestId,
      String? timestamp,
      int statusCode,
      String message,
      String localizedMessage,
      @JsonKey(unknownEnumValue: ErrorName.unknown) ErrorName errorName,
      String? path});
}

/// @nodoc
class _$APIErrorCopyWithImpl<$Res> implements $APIErrorCopyWith<$Res> {
  _$APIErrorCopyWithImpl(this._value, this._then);

  final APIError _value;
  // ignore: unused_field
  final $Res Function(APIError) _then;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? timestamp = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? localizedMessage = freezed,
    Object? errorName = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      localizedMessage: localizedMessage == freezed
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorName: errorName == freezed
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as ErrorName,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$APIErrorCopyWith<$Res> implements $APIErrorCopyWith<$Res> {
  factory _$APIErrorCopyWith(_APIError value, $Res Function(_APIError) then) =
      __$APIErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? requestId,
      String? timestamp,
      int statusCode,
      String message,
      String localizedMessage,
      @JsonKey(unknownEnumValue: ErrorName.unknown) ErrorName errorName,
      String? path});
}

/// @nodoc
class __$APIErrorCopyWithImpl<$Res> extends _$APIErrorCopyWithImpl<$Res>
    implements _$APIErrorCopyWith<$Res> {
  __$APIErrorCopyWithImpl(_APIError _value, $Res Function(_APIError) _then)
      : super(_value, (v) => _then(v as _APIError));

  @override
  _APIError get _value => super._value as _APIError;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? timestamp = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? localizedMessage = freezed,
    Object? errorName = freezed,
    Object? path = freezed,
  }) {
    return _then(_APIError(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      localizedMessage: localizedMessage == freezed
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorName: errorName == freezed
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as ErrorName,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_APIError implements _APIError {
  const _$_APIError(
      {required this.requestId,
      required this.timestamp,
      required this.statusCode,
      required this.message,
      required this.localizedMessage,
      @JsonKey(unknownEnumValue: ErrorName.unknown) required this.errorName,
      required this.path});

  factory _$_APIError.fromJson(Map<String, dynamic> json) =>
      _$$_APIErrorFromJson(json);

  @override
  final String? requestId;
  @override
  final String? timestamp;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final String localizedMessage;
  @override
  @JsonKey(unknownEnumValue: ErrorName.unknown)
  final ErrorName errorName;
  @override
  final String? path;

  @override
  String toString() {
    return 'APIError(requestId: $requestId, timestamp: $timestamp, statusCode: $statusCode, message: $message, localizedMessage: $localizedMessage, errorName: $errorName, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _APIError &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.localizedMessage, localizedMessage) &&
            const DeepCollectionEquality().equals(other.errorName, errorName) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestId),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(localizedMessage),
      const DeepCollectionEquality().hash(errorName),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$APIErrorCopyWith<_APIError> get copyWith =>
      __$APIErrorCopyWithImpl<_APIError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_APIErrorToJson(this);
  }
}

abstract class _APIError implements APIError {
  const factory _APIError(
      {required final String? requestId,
      required final String? timestamp,
      required final int statusCode,
      required final String message,
      required final String localizedMessage,
      @JsonKey(unknownEnumValue: ErrorName.unknown)
          required final ErrorName errorName,
      required final String? path}) = _$_APIError;

  factory _APIError.fromJson(Map<String, dynamic> json) = _$_APIError.fromJson;

  @override
  String? get requestId => throw _privateConstructorUsedError;
  @override
  String? get timestamp => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get localizedMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(unknownEnumValue: ErrorName.unknown)
  ErrorName get errorName => throw _privateConstructorUsedError;
  @override
  String? get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$APIErrorCopyWith<_APIError> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return _ErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponse {
//TODO: name this according to the map key from the error response
//if no map key exists then just create this factory with the APIError values
//and remove APIError,
  APIError get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseCopyWith<ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseCopyWith<$Res> {
  factory $ErrorResponseCopyWith(
          ErrorResponse value, $Res Function(ErrorResponse) then) =
      _$ErrorResponseCopyWithImpl<$Res>;
  $Res call({APIError error});

  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  final ErrorResponse _value;
  // ignore: unused_field
  final $Res Function(ErrorResponse) _then;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError,
    ));
  }

  @override
  $APIErrorCopyWith<$Res> get error {
    return $APIErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
abstract class _$ErrorResponseCopyWith<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  factory _$ErrorResponseCopyWith(
          _ErrorResponse value, $Res Function(_ErrorResponse) then) =
      __$ErrorResponseCopyWithImpl<$Res>;
  @override
  $Res call({APIError error});

  @override
  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$ErrorResponseCopyWithImpl<$Res>
    extends _$ErrorResponseCopyWithImpl<$Res>
    implements _$ErrorResponseCopyWith<$Res> {
  __$ErrorResponseCopyWithImpl(
      _ErrorResponse _value, $Res Function(_ErrorResponse) _then)
      : super(_value, (v) => _then(v as _ErrorResponse));

  @override
  _ErrorResponse get _value => super._value as _ErrorResponse;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_ErrorResponse(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponse implements _ErrorResponse {
  const _$_ErrorResponse({required this.error});

  factory _$_ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorResponseFromJson(json);

//TODO: name this according to the map key from the error response
//if no map key exists then just create this factory with the APIError values
//and remove APIError,
  @override
  final APIError error;

  @override
  String toString() {
    return 'ErrorResponse(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorResponse &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorResponseCopyWith<_ErrorResponse> get copyWith =>
      __$ErrorResponseCopyWithImpl<_ErrorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseToJson(this);
  }
}

abstract class _ErrorResponse implements ErrorResponse {
  const factory _ErrorResponse({required final APIError error}) =
      _$_ErrorResponse;

  factory _ErrorResponse.fromJson(Map<String, dynamic> json) =
      _$_ErrorResponse.fromJson;

  @override //TODO: name this according to the map key from the error response
//if no map key exists then just create this factory with the APIError values
//and remove APIError,
  APIError get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorResponseCopyWith<_ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
