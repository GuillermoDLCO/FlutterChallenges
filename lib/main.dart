import 'package:flutter/material.dart';
import 'package:flutterchallenges/res/pallete_color.dart';
import 'package:flutterchallenges/widgets/action_button.dart';

import 'hidden_drawer_bottom_bar_fab/hidden_drawer_bottom_bar_fab.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Challenges'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColor.actionButtonColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton(
              action: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HiddenMenuBottomBarFab())),
              label: 'Hidden menu with FAB in bottom bar',
            ),
          ],
        ),
      ),
    );
  }
}
