// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_presenter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  _ProfileState call({required bool isLoading, required String name}) {
    return _ProfileState(
      isLoading: isLoading,
      name: name,
    );
  }
}

/// @nodoc
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String name});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(
          _ProfileState value, $Res Function(_ProfileState) then) =
      __$ProfileStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String name});
}

/// @nodoc
class __$ProfileStateCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(
      _ProfileState _value, $Res Function(_ProfileState) _then)
      : super(_value, (v) => _then(v as _ProfileState));

  @override
  _ProfileState get _value => super._value as _ProfileState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProfileState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileState extends _ProfileState {
  _$_ProfileState({required this.isLoading, required this.name}) : super._();

  @override
  final bool isLoading;
  @override
  final String name;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);
}

abstract class _ProfileState extends ProfileState {
  factory _ProfileState({required bool isLoading, required String name}) =
      _$_ProfileState;
  _ProfileState._() : super._();

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
