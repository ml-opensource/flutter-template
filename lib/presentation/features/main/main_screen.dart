import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/main/ui/app_bottom_navigation_bar.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        NewsRoute(),
        ProfileRoute(),
      ],
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (_, tabsRouter) {
        return AppBottomNavigationBar(
          tabsRouter: tabsRouter,
          bottomNavigationBarItemList: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'News', icon: Icon(Icons.newspaper)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
