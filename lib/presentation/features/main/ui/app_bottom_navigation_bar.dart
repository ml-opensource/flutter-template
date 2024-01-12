import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.tabsRouter,
    required this.bottomNavigationBarItemList,
  });

  final TabsRouter tabsRouter;
  final List<BottomNavigationBarItem> bottomNavigationBarItemList;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: context.colors.background,
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: bottomNavigationBarItemList,
    );
  }
}
