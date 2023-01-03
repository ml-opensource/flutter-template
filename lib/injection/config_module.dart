import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/application_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ConfigModule {
  @preResolve
  Future<ApplicationConfig> readConfig(AppFlavor flavor) async {
    const basePath = 'assets/configuration/application_configuration';
    final configPath = '$basePath.${flavor.name}.json';

    final config = await rootBundle.loadString(configPath, cache: false);

    final json = jsonDecode(config) as Map<String, dynamic>;

    json.addAll({'flavor': flavor.name});

    return ApplicationConfig.fromJson(json);
  }
}
