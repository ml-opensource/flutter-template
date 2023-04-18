import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/widgets/app_textfield.dart';

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
      body: Column(
        children: [
          AppTextField.normal(
            hintText: 'Username',
            errorText: null,
          ),
          AppTextField.password(
            hintText: 'Password',
            errorText: 'password should be 6 character long',
          ),
        ]
      ),
    );
  }
}
