import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/app_router.dart';
import 'package:flutter_template/presentation/feature/home/home_screen_tab.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.tab = HomeScreenTab.news,
  }) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/home',
        builder: (_) => const HomeScreen(),
      );

  final HomeScreenTab tab;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenTab? _tabSelection;

  @override
  void initState() {
    _tabSelection = widget.tab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: _getSelectedPage(_tabSelection),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colors.surface,
        unselectedItemColor: context.colors.text,
        items: _getBottomNavigationBarItems(context),
        currentIndex: _tabSelection!.index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          _tabSelection = HomeScreenTab.values[index];
        }),
      ),
    );
  }

  Widget _getSelectedPage(HomeScreenTab? tab) {
    switch (tab) {
      case HomeScreenTab.news:
        return const Scaffold(
          body: Center(child: Text('News')),
        );
      case HomeScreenTab.profile:
        return const Scaffold(
          body: Center(child: Text('Profile')),
        );
      default:
        throw ("Unknown HomeScreenTab");
    }
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems(
    BuildContext context,
  ) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "News",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: "Profile",
      ),
    ];
  }
}
