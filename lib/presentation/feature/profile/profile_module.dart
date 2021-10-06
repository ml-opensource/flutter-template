import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/feature/profile/profile_view_model.dart';

class ProfileModule {
  static Future<void> inject() async {
    injector.registerFactory<ProfileViewModel>(
      () => ProfileViewModel(profileService: injector()),
    );
  }
}