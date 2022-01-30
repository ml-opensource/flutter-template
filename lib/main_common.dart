import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/dependencies/dependencies.dart';
import 'package:flutter_template/presentation/app.dart';

void mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependenciesManager.inject(flavor);
  runApp(const App());
}
