import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/feature/home/home_page_tab.dart';
import 'package:flutter_template/presentation/feature/news/news_screen.dart';
import 'package:flutter_template/presentation/feature/profile/profile_screen.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.tab}) : super(key: key);

  final HomePageTab? tab;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageTab? _tabSelection;

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
          _tabSelection = HomePageTab.values[index];
        }),
      ),
    );
  }

  Widget _getSelectedPage(HomePageTab? tab) {
    switch (tab) {
      case HomePageTab.news:
        return NewsScreen();
      case HomePageTab.profile:
        return ProfileScreen();
      default:
        throw ("Unknown HomePageTab");
    }
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems(
      BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "News",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: "Profile",
      ),
    ];
  }
}
