import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/global_widgets/action_button.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/navigation/routes.dart';
import 'package:flutterchallenges/theme/app_theme.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                ActionButton(
                  action: () {
                    context.read<ThemeBloc>().changeTheme(AppTheme.normal);
                    Navigator.pushNamed(
                      context,
                      Routes.hiddenDrawerBottomBarFab,
                    );
                  },
                  label: 'Hidden menu with FAB in bottom bar',
                ),
                ActionButton(
                  action: () {
                    context.read<ThemeBloc>().changeTheme(AppTheme.normal);
                    Navigator.pushNamed(context, Routes.spaceConceptOnboarding);
                  },
                  label: 'Space Concept',
                ),
                ActionButton(
                  action: () {
                    context.read<ThemeBloc>().changeTheme(AppTheme.normal);
                    Navigator.pushNamed(context, Routes.travelApp);
                  },
                  label: 'Travel App',
                ),
                ActionButton(
                  action: () {
                    context.read<ThemeBloc>().changeTheme(AppTheme.light);
                    Navigator.pushNamed(
                      context,
                      Routes.facebookPrincipalScreen,
                    );
                  },
                  label: 'Facebook Redesign',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
