import 'package:flutter/material.dart';
import 'package:flutter_template/injection/dependencies.dart';
import 'package:flutter_template/nstack/nstack.dart';
import 'package:flutter_template/presentation/app.dart';

import 'presentation/app_flavor.dart';

void mainCommon(AppFlavor flavor) async {
  await DependencyManager.inject(flavor);
  runApp(NStackWidget(child: const App()));
}
