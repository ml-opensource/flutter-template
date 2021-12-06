import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  factory ProfileState({
    required bool isLoading,
    required String name,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      name: '',
    );
  }
}
