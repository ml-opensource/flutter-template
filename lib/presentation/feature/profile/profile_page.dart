import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: Text("Profile"),
      ),
    );
  }
}
