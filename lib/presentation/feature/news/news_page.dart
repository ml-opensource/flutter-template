import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/widgets/app_button/app_button.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppButton.primary(
              onPressed: () {},
              child: const Text('Save'),
            ),
            const SizedBox(height: 30),
            AppButton.secondary(
              onPressed: () {},
              isLoading: false,
              child: const Text('Save'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
