import 'package:flutter/material.dart';
import 'package:flutterchallenges/navigation/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) => Routes.routes(settings),
    );
  }
}
