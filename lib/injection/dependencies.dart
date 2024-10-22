import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/routes/router.dart';

class DependencyManager {
  static Future<void> inject(AppFlavor flavor) async {
    injector.registerLazySingleton<AppFlavor>(() => flavor);
    // ignore: unnecessary_lambdas
    injector.registerLazySingleton<AppRouter>(() => AppRouter());
    return configureDependencies();
  }
}
