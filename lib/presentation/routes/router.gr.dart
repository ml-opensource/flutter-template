// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../feature/home/home_screen.dart' as _i2;
import '../feature/home/home_screen_tab.dart' as _i5;
import '../feature/splash/splash_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.HomeScreen(key: args.key, tab: args.tab));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i3.RouteConfig(HomeScreenRoute.name, path: '/home')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute(
      {_i4.Key? key, _i5.HomeScreenTab tab = _i5.HomeScreenTab.news})
      : super(HomeScreenRoute.name,
            path: '/home', args: HomeScreenRouteArgs(key: key, tab: tab));

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key, this.tab = _i5.HomeScreenTab.news});

  final _i4.Key? key;

  final _i5.HomeScreenTab tab;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, tab: $tab}';
  }
}
