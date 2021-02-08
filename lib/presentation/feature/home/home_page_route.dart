import 'package:flutter_template/presentation/feature/home/home_page.dart';
import 'package:flutter_template/presentation/feature/home/home_page_tab.dart';
import 'package:flutter_template/presentation/app_router.dart';

class HomePageRoute extends AppRoute {
  final HomePageTab tab;

  HomePageRoute({this.tab = HomePageTab.news});

  @override
  get page => HomePage(tab: tab);

  @override
  get name => '/';
}
