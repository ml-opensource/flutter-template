import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/features/news/ui/news_body.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: const Text('News'),
      ),
      body: const NewsBody(),
    );
  }
}
