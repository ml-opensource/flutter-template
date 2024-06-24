import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    List<ResultDto>? results,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
class ResultDto with _$ResultDto {
  const factory ResultDto({
    String? gender,
    NameDto? name,
    String? email,
    String? phone,
    String? cell,
  }) = _ResultDto;

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);
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
