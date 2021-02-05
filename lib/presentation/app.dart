import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/app_router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Name',
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
