import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_config.freezed.dart';
part 'application_config.g.dart';

@freezed
class ApplicationConfig with _$ApplicationConfig {
  const factory ApplicationConfig({
    required String apiUrl,
    required AppFlavor flavor,
  }) = _ApplicationConfig;

  factory ApplicationConfig.fromJson(Map<String, dynamic> json) =>
      _$ApplicationConfigFromJson(json);
}
