import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenges/global_widgets/action_button.dart';
import 'package:flutterchallenges/navigation/routes.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Color(0xff0A0A14),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PalleteColor.actionButtonColor,
          title: const Text('Flutter Challenges'),
          centerTitle: true,
          brightness: Brightness.dark,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              ActionButton(
                action: () => Navigator.pushNamed(context, Routes.hiddenDrawerBottomBarFab),
                label: 'Hidden menu with FAB in bottom bar',
              ),
              ActionButton(
                action: () => Navigator.pushNamed(context, Routes.spaceConceptOnboarding),
                label: 'Space Concept',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
