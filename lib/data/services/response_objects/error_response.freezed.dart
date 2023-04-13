// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$APIErrorCopyWithImpl<$Res, APIError>;
  @useResult
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
class _$APIErrorCopyWithImpl<$Res, $Val extends APIError>
    implements $APIErrorCopyWith<$Res> {
  _$APIErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? timestamp = freezed,
    Object? statusCode = null,
    Object? message = null,
    Object? localizedMessage = null,
    Object? errorName = null,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      localizedMessage: null == localizedMessage
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as ErrorName,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_APIErrorCopyWith<$Res> implements $APIErrorCopyWith<$Res> {
  factory _$$_APIErrorCopyWith(
          _$_APIError value, $Res Function(_$_APIError) then) =
      __$$_APIErrorCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_APIErrorCopyWithImpl<$Res>
    extends _$APIErrorCopyWithImpl<$Res, _$_APIError>
    implements _$$_APIErrorCopyWith<$Res> {
  __$$_APIErrorCopyWithImpl(
      _$_APIError _value, $Res Function(_$_APIError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = freezed,
    Object? timestamp = freezed,
    Object? statusCode = null,
    Object? message = null,
    Object? localizedMessage = null,
    Object? errorName = null,
    Object? path = freezed,
  }) {
    return _then(_$_APIError(
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      localizedMessage: null == localizedMessage
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as ErrorName,
      path: freezed == path
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
            other is _$_APIError &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.localizedMessage, localizedMessage) ||
                other.localizedMessage == localizedMessage) &&
            (identical(other.errorName, errorName) ||
                other.errorName == errorName) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, timestamp, statusCode,
      message, localizedMessage, errorName, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_APIErrorCopyWith<_$_APIError> get copyWith =>
      __$$_APIErrorCopyWithImpl<_$_APIError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_APIErrorToJson(
      this,
    );
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
  String? get requestId;
  @override
  String? get timestamp;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  String get localizedMessage;
  @override
  @JsonKey(unknownEnumValue: ErrorName.unknown)
  ErrorName get errorName;
  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$_APIErrorCopyWith<_$_APIError> get copyWith =>
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
      _$ErrorResponseCopyWithImpl<$Res, ErrorResponse>;
  @useResult
  $Res call({APIError error});

  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res, $Val extends ErrorResponse>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<$Res> get error {
    return $APIErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ErrorResponseCopyWith<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  factory _$$_ErrorResponseCopyWith(
          _$_ErrorResponse value, $Res Function(_$_ErrorResponse) then) =
      __$$_ErrorResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({APIError error});

  @override
  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_ErrorResponseCopyWithImpl<$Res>
    extends _$ErrorResponseCopyWithImpl<$Res, _$_ErrorResponse>
    implements _$$_ErrorResponseCopyWith<$Res> {
  __$$_ErrorResponseCopyWithImpl(
      _$_ErrorResponse _value, $Res Function(_$_ErrorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorResponse(
      error: null == error
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
            other is _$_ErrorResponse &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith =>
      __$$_ErrorResponseCopyWithImpl<_$_ErrorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseToJson(
      this,
    );
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
  APIError get error;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
