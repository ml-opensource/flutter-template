import 'package:flutter/material.dart';
import 'package:flutter_template/injection/dependencies.dart';
import 'package:flutter_template/presentation/app.dart';
import 'package:flutter_template/presentation/app_flavor.dart';

// ignore: avoid_void_async
void mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyManager.inject(flavor);
  runApp(const App());
}
