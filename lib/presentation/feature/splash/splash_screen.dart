import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/app_router.dart';
import 'package:flutter_template/presentation/feature/home/home_screen.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/',
        builder: (_) => const SplashScreen(),
      );

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        HomeScreen.route.fade(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.accent,
      body: const SafeArea(
        child: Center(
          child: Text('SplashScreen'),
        ),
      ),
    );
  }
}
