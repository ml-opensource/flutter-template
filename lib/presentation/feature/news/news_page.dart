import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: const Text("News"),
      ),
    );
  }
}
