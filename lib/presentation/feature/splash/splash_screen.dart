import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/routes/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 2), () {
      injector.get<AppNavigator>().navigateToHome();
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
