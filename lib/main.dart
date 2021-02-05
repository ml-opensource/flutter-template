import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/icons.dart';
import 'package:flutter_template/presentation/widgets/svg_icon.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Usage of textstyle and color
            Text(
              '$_counter',
              style: context.textStyles.headline1.copyWith(
                color: context.colors.accent,
              ),
            ),
          ],
        ),
      ),
      // Usage of Icon
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SvgIcon.from(AppIcons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
