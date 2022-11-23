import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/bottom_bar.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/pick_to_option.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/top_bar.dart';

class SpaceConceptExplorePlanetScreen extends StatelessWidget {
  const SpaceConceptExplorePlanetScreen({super.key});

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
        body: _ExploreBody(),
        bottomNavigationBar: BottomBar(),
        extendBody: true,
      ),
    );
  }
}

class _ExploreBody extends StatelessWidget {
  const _ExploreBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/space_concept/explore_screen_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  bottom: 30,
                ),
                child: SvgPicture.asset('assets/space_concept/arrow_back.svg'),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  OverflowBox(
                    maxHeight: MediaQuery.of(context).size.height * 1,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: const [
                        _Atmosphere(),
                        _PlanetMediaItem(),
                      ],
                    ),
                  ),
                  const _ExploreInformation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExploreInformation extends StatelessWidget {
  const _ExploreInformation();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PickToExplore(number: 3, radius: 12, action: () {}),
              const SizedBox(width: 10),
              const Text(
                'Earth',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mark',
                  color: Colors.white,
                  height: 0.9,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant'
            ' sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Atmosphere extends StatelessWidget {
  const _Atmosphere();

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxHeight: MediaQuery.of(context).size.height * 2,
      maxWidth: MediaQuery.of(context).size.width * 2,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: .3),
        ),
        width: MediaQuery.of(context).size.width * 2,
      ),
    );
  }
}

class _PlanetMediaItem extends StatelessWidget {
  const _PlanetMediaItem();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'earth',
      child: Image.asset(
        'assets/space_concept/earth_planet_with_shadow_clip.png',
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
