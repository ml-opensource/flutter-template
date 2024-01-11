import 'package:flutter_template/domain/common/base_status/base_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  factory ProfileState({
    @Default(BaseStatus.initial()) BaseStatus initializationStatus,
    @Default('N/A') String name,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState();
  }
}
