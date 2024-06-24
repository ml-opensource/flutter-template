import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const ProfileEntity._();

  const factory ProfileEntity({
    required String firstName,
    required String lastName,
  }) = _ProfileEntity;

  String get fullName {
    if (firstName.isEmpty && lastName.isEmpty) {
      return 'N/A';
    }

    return '$firstName $lastName'.trim();
  }
}
