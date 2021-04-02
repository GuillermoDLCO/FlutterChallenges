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
        statusBarColor: PalleteColor.actionButtonColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PalleteColor.actionButtonColor,
            title: const Text('Flutter Challenges'),
            centerTitle: true,
            brightness: Brightness.light,
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
      ),
    );
  }
}
