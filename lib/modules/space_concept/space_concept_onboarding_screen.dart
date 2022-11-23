import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/navigation/routes.dart';

class SpaceConceptOnboardingScreen extends StatefulWidget {
  const SpaceConceptOnboardingScreen({super.key});

  @override
  State<SpaceConceptOnboardingScreen> createState() =>
      _SpaceConceptOnboardingScreenState();
}

class _SpaceConceptOnboardingScreenState
    extends State<SpaceConceptOnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _BodyOnboarding(),
        ),
      ),
    );
  }
}

class _BodyOnboarding extends StatelessWidget {
  const _BodyOnboarding();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _SpaceElementTitle(),
        _AstronauteIcon(),
        _IntroductionSlider(),
      ],
    );
  }
}

class _IntroductionSlider extends StatefulWidget {
  const _IntroductionSlider();

  @override
  __IntroductionSliderState createState() => __IntroductionSliderState();
}

class __IntroductionSliderState extends State<_IntroductionSlider> {
  final PageController _pageController = PageController();
  List<Widget> stepWidget = [];
  bool isFinal = false;

  @override
  void initState() {
    super.initState();
    stepWidget.addAll([
      _FirstStep(updatePosition: updatePosition),
      _SecondStep(updatePosition: updatePosition),
      _ThirdStep(updatePosition: updatePosition),
    ]);
    _pageController.addListener(() {
      isFinal = _pageController.page!.toInt() == stepWidget.length - 1;
      setState(() {});
    });
  }

  Future<void> updatePosition(int position) async {
    if (position < stepWidget.length) {
      await _pageController.animateToPage(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: stepWidget.length,
              itemBuilder: (context, index) => stepWidget[index],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
              vertical: MediaQuery.of(context).size.height * .03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.spaceConceptIntro),
                  child: const Text(
                    'Skip Step',
                    style: TextStyle(
                      color: Color(0xffBBBBBB),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mark',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(105, 34),
                  ),
                  onPressed: () => isFinal
                      ? Navigator.of(context)
                          .pushNamed(Routes.spaceConceptIntro)
                      : updatePosition(_pageController.page!.toInt() + 1),
                  child: Text(
                    isFinal ? 'Done' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mark',
                    ),
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

class _FirstStep extends StatelessWidget {
  const _FirstStep({
    required this.updatePosition,
  });

  final ValueSetter<int> updatePosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Universe',
                  style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                  'egestas habitant.',
                  style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => updatePosition(1),
              child: Container(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/space_concept/right_arrow.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SecondStep extends StatelessWidget {
  const _SecondStep({
    required this.updatePosition,
  });

  final ValueSetter<int> updatePosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => updatePosition(0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/space_concept/left_arrow.svg',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Universe',
                  style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                  'egestas habitant.',
                  style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => updatePosition(2),
              child: Container(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset('assets/space_concept/right_arrow.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ThirdStep extends StatelessWidget {
  const _ThirdStep({
    required this.updatePosition,
  });

  final ValueSetter<int> updatePosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => updatePosition(1),
              child: Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/space_concept/left_arrow.svg',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Universe',
                  style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                  'egestas habitant.',
                  style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AstronauteIcon extends StatelessWidget {
  const _AstronauteIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/space_concept/onboarding.svg',
      fit: BoxFit.fitWidth,
      height: MediaQuery.of(context).size.height * .33,
      width: double.infinity,
    );
  }
}

class _SpaceElementTitle extends StatelessWidget {
  const _SpaceElementTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .08,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Space',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mark',
            ),
          ),
          Text(
            'Element',
            style: TextStyle(fontSize: 35, fontFamily: 'Mark'),
          ),
        ],
      ),
    );
  }
}
