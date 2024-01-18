import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/home/ui/home_body.dart';
import 'package:flutter_template/presentation/widgets/app_bar/top_app_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBar(
        label: 'Home',
      ),
      body: HomeBody(),
    );
  }
}
