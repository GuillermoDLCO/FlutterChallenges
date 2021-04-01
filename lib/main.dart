import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';
import 'package:flutterchallenges/global_widgets/action_button.dart';

import 'hidden_drawer_bottom_bar_fab/hidden_drawer_bottom_bar_fab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
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

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColor.actionButtonColor,
        title: Text(title),
        centerTitle: true,
        brightness: Brightness.dark,
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
