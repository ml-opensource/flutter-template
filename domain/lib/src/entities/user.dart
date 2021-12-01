import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required int id,
    required String username,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
