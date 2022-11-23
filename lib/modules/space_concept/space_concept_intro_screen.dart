import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/navigation/routes.dart';

class SpaceConceptIntroScreen extends StatelessWidget {
  const SpaceConceptIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff052740),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Color(0xff0A0A14),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Color(0xff0A0A14),
          body: _HomeBody(),
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _BackgroundPlanet(),
        _SpaceExplorationDescription(),
      ],
    );
  }
}

class _SpaceExplorationDescription extends StatelessWidget {
  const _SpaceExplorationDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          _CloseButton(),
          SizedBox(height: 20),
          Text(
            'Space',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
          Text(
            'Exploration',
            style: TextStyle(
              fontSize: 45,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant '
            'sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'View More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundPlanet extends StatelessWidget {
  const _BackgroundPlanet();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: const Alignment(0, 1.5),
            child: Image.asset(
              'assets/space_concept/space_exploration_planet.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Space',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Element',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Mark',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.spaceConceptPrincipal),
        child: SvgPicture.asset(
          'assets/space_concept/close.svg',
        ),
      ),
    );
  }
}
