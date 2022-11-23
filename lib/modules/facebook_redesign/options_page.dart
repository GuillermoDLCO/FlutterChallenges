import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/top_bar_app.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopBarApp(),
        SizedBox(height: 20),
        _MenuSection(),
      ],
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const _MenuRow(),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 28),
                      const _ScrollSettingButtons(),
                      const SizedBox(height: 27),
                      const _ScrollSpecialCards(),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width * .5 - 40.0) /
                                  (MediaQuery.of(context).size.width * .15),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          primary: false,
                          children: const [
                            _SettingGridOption(
                              icon: 'assets/facebook_redesign/youtube.svg',
                              label: 'Videos en Watch',
                            ),
                            _SettingGridOption(
                              icon:
                                  'assets/facebook_redesign/shopping_cart.svg',
                              label: 'Marketplace',
                            ),
                            _SettingGridOption(
                              icon: 'assets/facebook_redesign/heart.svg',
                              label: 'Parejas',
                            ),
                            _SettingGridOption(
                              icon: 'assets/facebook_redesign/games.svg',
                              label: 'Videojuegos',
                            ),
                            _SettingGridOption(
                              icon: 'assets/facebook_redesign/shopping-bag.svg',
                              label: 'Empleos',
                            ),
                            _SettingGridOption(
                              icon: 'assets/facebook_redesign/bookmark.svg',
                              label: 'Guardados',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingGridOption extends StatelessWidget {
  const _SettingGridOption({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: theme.colorScheme.primary,
      ),
      padding: EdgeInsets.all(size.width * .05),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: size.width * .06),
          SizedBox(width: size.width * .03),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(
                  color: theme.textTheme.bodyText1?.color,
                  fontSize: 13,
                  height: 1.3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ScrollSpecialCards extends StatelessWidget {
  const _ScrollSpecialCards();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height * .20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 20),
          Container(
            height: size.height * .20,
            width: size.height * .35,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/facebook_redesign/history_saved.png',
                ),
              ),
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: size.height * .015,
                  top: size.height * .015,
                  child: CircleAvatar(
                    backgroundColor: theme.colorScheme.primary,
                    radius: size.width * .04,
                    child: SvgPicture.asset(
                      'assets/facebook_redesign/history.svg',
                      width: size.width * .035,
                    ),
                  ),
                ),
                Positioned(
                  right: size.height * .015,
                  bottom: size.height * .015,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffEFF8FD),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: const Text(
                      'Hace 3 años',
                      style: TextStyle(color: Color(0xff2D3F7B), fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: size.height * .20,
            width: size.height * .35,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/facebook_redesign/covid_campaign.png',
                ),
              ),
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: size.height * .02,
                  top: size.height * .02,
                  child: const Text(
                    'Centro de información\nCOVID-19',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            'Menú',
            style: TextStyle(
              color: theme.textTheme.bodyText1?.color,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/facebook_redesign/dark_mode.svg',
            width: MediaQuery.of(context).size.width * .045,
          ),
          const SizedBox(width: 10),
          Text(
            'Modo oscuro',
            style: TextStyle(
              color: theme.textTheme.bodyText1?.color,
              fontSize: 13,
            ),
          ),
          const _SwitchThemeMode(),
        ],
      ),
    );
  }
}

class _ScrollSettingButtons extends StatelessWidget {
  const _ScrollSettingButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _SettingButton(
            icon: 'assets/facebook_redesign/help.svg',
            label: 'Ayuda y soporte',
          ),
          SizedBox(width: 10),
          _SettingButton(
            icon: 'assets/facebook_redesign/settings.svg',
            label: 'Configuración y privacidad',
          ),
          SizedBox(width: 10),
          _SettingButton(
            icon: 'assets/facebook_redesign/camera.svg',
            label: 'Privacidad Multimedia',
          ),
        ],
      ),
    );
  }
}

class _SettingButton extends StatelessWidget {
  const _SettingButton({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: theme.colorScheme.primary,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: size.width * .04),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: theme.textTheme.bodyText1?.color,
              fontSize: 12,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }
}

class _SwitchThemeMode extends StatefulWidget {
  const _SwitchThemeMode();

  @override
  __SwitchThemeModeState createState() => __SwitchThemeModeState();
}

class __SwitchThemeModeState extends State<_SwitchThemeMode> {
  bool currentStatus = false;

  void changeStatus({required bool status}) {
    setState(() {
      currentStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Transform.scale(
      scale: 0.5,
      child: CupertinoSwitch(
        activeColor: const Color(0xff1977F4),
        value: currentStatus,
        onChanged: (status) {
          themeBloc.changeTheme(status ? AppTheme.dark : AppTheme.light);
          changeStatus(status: status);
        },
      ),
    );
  }
}
