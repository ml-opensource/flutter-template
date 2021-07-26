import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/feature/profile/profile_presenter.dart';

class ProfileModule {
  static Future<void> inject() async {
    injector.registerFactory<ProfilePresenter>(
      () => ProfilePresenter(profileService: injector()),
    );
  }
}
