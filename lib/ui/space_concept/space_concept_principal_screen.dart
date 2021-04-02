import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/navigation/routes.dart';
import 'package:flutterchallenges/ui/space_concept/widgets/bottom_bar.dart';
import 'package:flutterchallenges/ui/space_concept/widgets/pick_to_option.dart';
import 'package:flutterchallenges/ui/space_concept/widgets/top_bar.dart';

class SpaceConceptPrincipalScreen extends StatelessWidget {
  const SpaceConceptPrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff1B122E),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Color(0xff0A0A14),
        body: _PrincipalBody(),
        bottomNavigationBar: BottomBar(),
        extendBody: true,
      ),
    );
  }
}

class _PrincipalBody extends StatelessWidget {
  const _PrincipalBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/space_concept/planet_screen_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 10),
            const _SearchBar(),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  const _PlanetMediaItem(),
                  const _PlanetInformation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanetMediaItem extends StatelessWidget {
  const _PlanetMediaItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: .3),
            ),
          ),
          Hero(
            tag: 'earth',
            child: Image.asset(
              'assets/space_concept/planet_with_shadow.png',
              height: MediaQuery.of(context).size.height * .6,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          PickToExplore(
            number: 1,
            action: () {},
            marginPosition: EdgeInsets.only(right: MediaQuery.of(context).size.height * .31),
          ),
          PickToExplore(
            number: 2,
            action: () {},
            marginPosition: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * .2,
              top: MediaQuery.of(context).size.height * .24,
            ),
          ),
          PickToExplore(
            number: 3,
            action: () => Navigator.of(context).pushNamed(Routes.spaceConceptExplorePlanet),
            marginPosition: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * .23,
              bottom: MediaQuery.of(context).size.height * .24,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanetInformation extends StatelessWidget {
  const _PlanetInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Earth',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Mark', color: Colors.white),
            ),
            const Text(
              'Planet',
              style: TextStyle(fontSize: 45, fontFamily: 'Mark', color: Colors.white),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
              style: TextStyle(fontSize: 12, fontFamily: 'Mark', color: Colors.white),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  'View More',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Mark', color: Colors.white),
                ),
                const SizedBox(width: 15.0),
                SvgPicture.asset('assets/space_concept/right_arrow.svg', height: 10, color: Colors.white)
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.5), color: Colors.white.withOpacity(.2)),
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 5.0),
      child: Row(
        children: [
          SvgPicture.asset('assets/space_concept/search.svg'),
          const SizedBox(width: 20.0),
          const Text(
            'Search your favorite planet',
            style: TextStyle(fontSize: 10, fontFamily: 'Mark', color: Colors.white),
          ),
        ],
      ),
    );
  }
}
