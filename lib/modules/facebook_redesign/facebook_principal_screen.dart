import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/bottom_navigation_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/home_page.dart';
import 'package:flutterchallenges/modules/facebook_redesign/options_page.dart';
import 'package:flutterchallenges/modules/facebook_redesign/friends_page.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/bottom_bar_app.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class FacebookPrincipalScreen extends StatelessWidget {
  const FacebookPrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeBloc = context.watch<ThemeBloc>();
    final isLight = themeBloc.state.appThemeType == AppTheme.Light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: isLight ? Colors.white : theme.bottomAppBarColor,
        systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarColor: isLight ? Colors.white : theme.primaryColor,
        statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarBrightness: isLight ? Brightness.dark : Brightness.light,
      ),
      child: SafeArea(
        child: BlocProvider(
          create: (context) => BottomNavigationBloc(),
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (BuildContext context, BottomNavigationState state) {
                return IndexedStack(
                  index: state.page.index,
                  children: [
                    const HomePage(),
                    Container(),
                    Container(),
                    const FriendsPage(),
                    const OptionsPage(),
                  ],
                );
              },
            ),
            extendBody: true,
            bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(builder: (BuildContext context, BottomNavigationState state) {
              final bottomNavigationBloc = context.read<BottomNavigationBloc>();
              return BottomBarApp(
                onTabSelected: (index) => bottomNavigationBloc.changePage(IndexPage.values[index]),
                selectedIndex: bottomNavigationBloc.state.page.index,
                backgroundColor: theme.bottomAppBarColor,
                color: const Color(0xffCFD7ED),
                selectedColor: const Color(0xff1977F3),
                height: 65.0,
                items: [
                  const BottomBarAppItem(icon: 'assets/facebook_redesign/home.svg'),
                  const BottomBarAppItem(icon: 'assets/facebook_redesign/play.svg', hasNotification: true),
                  const BottomBarAppItem(icon: 'assets/facebook_redesign/market.svg', hasNotification: true),
                  const BottomBarAppItem(icon: 'assets/facebook_redesign/profile.svg'),
                  const BottomBarAppItem(icon: 'assets/facebook_redesign/more_options_bottom_bar.svg'),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
