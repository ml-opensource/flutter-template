import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  factory ProfileState({
    @Default(false) bool isLoading,
    @Default('') String name,
  }) = _ProfileState;
}
