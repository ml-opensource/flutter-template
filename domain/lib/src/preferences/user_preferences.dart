import 'package:domain/src/entities/user.dart';

abstract class UserPreferences {
  User? getUser();

  Future setUser(User user);

  Future<void> clearAll();
}
