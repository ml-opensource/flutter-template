import 'package:flutter_template/data/preferences/auth_preferences.dart';
import 'package:flutter_template/data/preferences/user_shared_preferences.dart';
import 'package:flutter_template/data/services/http_profile_service.dart';
import 'package:flutter_template/domain/preferences/user_preferences.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:flutter_template/injection/injector.dart';

class DataModule {
  static Future<void> inject() async {
    // Prefs
    injector.registerLazySingleton<AuthPreferences>(
      () => AuthPreferences(injector()),
    );
    injector.registerLazySingleton<UserPreferences>(
      () => UserSharedPreferences(injector()),
    );

    // Services
    injector.registerLazySingleton<ProfileService>(
      () => HttpProfileService(),
    );
  }
}
