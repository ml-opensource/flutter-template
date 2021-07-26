part of 'profile_presenter.dart';

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
      name: "",
    );
  }
}
