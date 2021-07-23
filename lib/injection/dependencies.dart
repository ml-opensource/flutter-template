import 'package:flutter_template/presentation/app_flavor.dart';
import 'injector.dart';

class DependencyManager {
	static Future<void> inject(AppFlavor flavor) async {
		injector.registerLazySingleton<AppFlavor>(() => flavor);

		// App modules
		//await *Module.inject();

		// Feature modules
		//await *Module.inject();

	}
}