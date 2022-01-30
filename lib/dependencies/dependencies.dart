import 'package:domain/domain.dart';
import 'package:flutter_template/dependencies/data_module.dart';
import 'package:flutter_template/dependencies/domain_module.dart';
import 'package:get_it/get_it.dart';

GetIt dependencies = GetIt.instance;

class DependenciesManager {
  static Future<void> inject(AppFlavor flavor) async {
    dependencies.registerLazySingleton<AppFlavor>(() => flavor);

    await DataModule.inject(flavor);
    await DomainModule.inject();
  }
}
