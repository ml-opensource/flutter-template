import 'package:flutter_template/injection/data_module.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/feature/profile/profile_module.dart';
import 'injector.dart';

class DependencyManager {
	static Future<void> inject(AppFlavor flavor) async {
		injector.registerLazySingleton<AppFlavor>(() => flavor);

		// App modules
		await DataModule.inject();

		// Feature modules
		await ProfileModule.inject();
	}
}