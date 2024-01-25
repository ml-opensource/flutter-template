import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

/// 💡 Tip: Both `~Screen`, `~Page` will be treated as `~Route` by [AutoRoute].
///
/// Consider using `~Screen` as screen naming, and `~Page` if it is part of screen view,
/// for example, Bottom navigation child views, tab views, etc.
///
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'news',
              initial: true,
            ),
            AutoRoute(
              page: NewsRoute.page,
              path: 'news',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),

        // Playground Screen: Keep it as the last item of this list.
        AutoRoute(
          page: PlaygroundRoute.page,
          path: '/playground',
          fullscreenDialog: true,
        ),
      ];
}
