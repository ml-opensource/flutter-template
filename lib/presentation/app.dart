import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/nstack/nstack.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/routes/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = injector.get<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.fromBrightness(Brightness.light),
      darkTheme: AppTheme.fromBrightness(Brightness.dark),
      // TODO: Set to [ThemeMode.light] if your app only supports light mode
      themeMode: ThemeMode.system,
      title: 'Project Name',
      builder: (c, widget) {
        if (widget == null) return const SizedBox();

        return NStackWidget(
          child: widget,
        );
      },
      routerDelegate: AutoRouterDelegate(
        appRouter,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
