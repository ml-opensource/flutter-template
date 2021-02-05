import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/feature/home/home_page_tab.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/widgets/svg_icon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.tab}) : super(key: key);

  final HomePageTab tab;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.accent,
        title: Text(widget.tab.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: AppTextStyles.body1.copyWith(
                color: context.colors.text,
              ),
            ),
            Text(
              '$_counter',
              style: AppTextStyles.headline1.copyWith(
                color: context.colors.accent,
              ),
            ),
          ],
        ),
      ),
      // Usage of icon
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        elevation: 0,
        backgroundColor: context.colors.accent,
        child: SvgIcon.from(
          AppIcons.add,
          color: context.colors.text,
        ),
      ),
    );
  }
}
