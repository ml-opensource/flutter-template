import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/app_router.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Name',
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
