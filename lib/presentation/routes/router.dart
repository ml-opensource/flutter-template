import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
      ];
}
