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
      appBar: AppBar(
        title: Text(widget.tab.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Usage of Textstyle and color
            Text(
              '$_counter',
              style: context.textStyles.headline1.copyWith(
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
        backgroundColor: Colors.transparent,
        child: SvgIcon.from(AppIcons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
