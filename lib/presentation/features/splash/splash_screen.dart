import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:flutter_template/presentation/widgets/text/app_text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      context.router.replace(const MainRoute());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.appBarBackground,
      body: SafeArea(
        child: Center(
          child: AppText.body(
            'SplashScreen',
            color: context.colors.foregroundOnAppBar,
          ),
        ),
      ),
    );
  }
}
