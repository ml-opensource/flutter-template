import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/_playground/playground_screen.dart';
import 'package:flutter_template/presentation/resources/app_ui_constants.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppUiConstants.defaultScreenHorizontalPadding,
      child: Center(
        child: PlaygroundScreenOpenerButton(),
      ),
    );
  }
}
