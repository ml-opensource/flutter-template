import 'package:flutter_template/domain/entities/user.dart';

abstract class UserPreferences {
  User? getUser();

  Future setUser(User user);

  Future<void> clearAll();
}
