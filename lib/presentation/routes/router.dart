import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/feature/home/home_screen.dart';
import 'package:flutter_template/presentation/feature/home/home_screen_tab.dart';
import 'package:flutter_template/presentation/feature/splash/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
  ];
}
