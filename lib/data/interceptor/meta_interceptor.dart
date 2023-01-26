import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MetaInterceptor extends InterceptorsWrapper {
  MetaInterceptor(this.flavor);

  static String nMetaHeaderKey = 'n-meta';

  final AppFlavor flavor;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['Accept'] == null) {
      options.headers['Accept'] = 'application/json; charset=UTF-8';
    }
    if (options.headers['content-type'] == null) {
      options.headers['content-type'] = 'application/json';
    }
    options.headers[nMetaHeaderKey] = '$platform;${flavor.name};'
        '${await appVersion};${await platformVersion};${await device}';
    handler.next(options);
  }

  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();

  String get platform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'android';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'ios';
    } else {
      return 'web';
    }
  }

  Future<String?> get platformVersion async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return (await deviceInfo.androidInfo).version.release;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return (await deviceInfo.iosInfo).systemVersion;
    }
    return 'unknown';
  }

  Future<String> get appVersion async {
    return PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      return packageInfo.version
          .replaceAll('-qa', '')
          .replaceAll('-staging', '')
          .replaceAll('-development', '');
    }).onError((error, stackTrace) => '0.0.0');
  }

  Future<String?> get device async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return (await deviceInfo.androidInfo).model;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return (await deviceInfo.iosInfo).utsname.machine;
    }
    return 'unknown';
  }
}
