import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/feature/splash/splash_screen.dart';

/// Contains classes and helpers for navigation.
class AppRouter {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return args is ScreenRoute
        ? args.material()
        : SplashScreen.route.material();
  }
}

class ScreenRoute {
  ScreenRoute({required this.name, required this.builder});
  final String name;

  final WidgetBuilder builder;

  PageRoute material() {
    return MaterialPageRoute(
      builder: builder,
      settings: RouteSettings(name: name, arguments: this),
    );
  }

  PageRoute dialog({bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      fullscreenDialog: fullscreenDialog,
      builder: builder,
      settings: RouteSettings(name: name, arguments: this),
    );
  }

  PageRoute fade() {
    return FadePageRoute(
      screen: builder,
      name: name,
      arguments: this,
    );
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute({
    required this.screen,
    required this.name,
    Object? arguments,
  }) : super(settings: RouteSettings(name: name, arguments: arguments));

  final WidgetBuilder screen;
  final String name;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return FadeTransition(
      opacity: animation,
      child: screen(context),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(microseconds: 300);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => '';
}
