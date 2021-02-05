import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/presentation/feature/home/home_page_route.dart';

/// Contains classes and helpers for navigation.
/// To navigate to a page use the [BuildContext.navigateTo] extension function.
/// - Example: context.navigateTo(HomeRoute(fieldExample = "hello"));
/// To pop the Navigation stack to a specific page use the [BuildContext.popUntil] extension function.
/// - Example: context.popUntil(HomeRoute.name);
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return args is AppRoute ? args.route : HomePageRoute().route;
  }
}

abstract class AppRoute {
  String get name;

  Widget get page;

  MaterialPageRoute get route {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: name),
    );
  }
}
