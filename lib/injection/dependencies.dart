import 'package:flutter_template/injection/data_module.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/feature/profile/profile_module.dart';
import 'package:flutter_template/presentation/routes/app_navigator.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

import 'injector.dart';

class DependencyManager {
  static Future<void> inject(AppFlavor flavor) async {
    injector.registerLazySingleton<AppFlavor>(() => flavor);
    injector.registerLazySingleton<AppRouter>(() => AppRouter());
    injector.registerLazySingleton<AppNavigator>(
        () => AppNavigator(injector.get<AppRouter>()));

    // App modules
    await DataModule.inject();

    // Feature modules
    await ProfileModule.inject();
  }
}
