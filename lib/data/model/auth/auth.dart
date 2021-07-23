

import 'package:flutter_template/data/model/auth/token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

part 'auth.g.dart';

@freezed
class Auth  with _$Auth {
	const factory Auth({
		required int id,
		required String username,
		required DateTime createdAt,
		required Token token,
	}) = _Auth;

	factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}