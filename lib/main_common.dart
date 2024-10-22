import 'package:flutter/material.dart';
import 'package:flutter_template/injection/dependencies.dart';
import 'package:flutter_template/presentation/app.dart';
import 'package:flutter_template/presentation/app_flavor.dart';
import 'package:flutter_template/presentation/common/assets_cache_manager.dart';

// ignore: avoid_void_async
void mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyManager.inject(flavor);
  await AssetsCachingManager.cacheAnimationsRoot();
  runApp(const App());
}
