import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/application_config.dart';

abstract class ConfigModule {
  /// Can't use injectable with preresolve as it fails with a stack overflow exception
  /// because here we depend on the flutter/services package.
  static Future<void> inject(AppFlavor flavor) async {
    const basePath = 'assets/configuration/application_configuration';
    final configPath = '$basePath.${flavor.name}.json';

    final configContent = await rootBundle.loadString(configPath, cache: false);

    final json = jsonDecode(configContent) as Map<String, dynamic>;

    json.addAll({'flavor': flavor.name});

    final config = ApplicationConfig.fromJson(json);

    injector.registerSingleton(config);
  }
}
