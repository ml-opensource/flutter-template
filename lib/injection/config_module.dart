import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/application_config.dart';

abstract class ConfigModule {
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
