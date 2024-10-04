import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    List<ProfileResultDto>? results,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
class ProfileResultDto with _$ProfileResultDto {
  const factory ProfileResultDto({
    String? gender,
    NameDto? name,
    String? email,
    String? phone,
    String? cell,
  }) = _ProfileResultDto;

  factory ProfileResultDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileResultDtoFromJson(json);
}

@freezed
class NameDto with _$NameDto {
  const factory NameDto({
    String? title,
    String? first,
    String? last,
  }) = _NameDto;

  factory NameDto.fromJson(Map<String, dynamic> json) =>
      _$NameDtoFromJson(json);
}
