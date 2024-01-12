import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/_playground/playground_screen.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PlaygroundScreenOpenerButton(),
    );
  }
}
