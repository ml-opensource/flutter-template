import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Store the current authenticated user's basic information.
class UserSharedPreferences extends UserPreferences {
  UserSharedPreferences(this._preferences);

  final SharedPreferences _preferences;

  static const String _prefix = 'user_prefs';
  static const String _userJsonKey = '${_prefix}_user_json';

  @override
  Future setUser(User user) async {
    return _preferences.setString(_userJsonKey, json.encode(user.toJson()));
  }

  @override
  User? getUser() {
    final userJson = _preferences.getString(_userJsonKey);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  @override
  Future<void> clearAll() async {
    await _preferences.remove(_userJsonKey);
  }
}
