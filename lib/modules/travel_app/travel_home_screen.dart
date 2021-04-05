import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/travel_app/country.dart';
import 'package:flutterchallenges/modules/travel_app/travel_app_bloc.dart';
import 'package:flutterchallenges/navigation/routes.dart';

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'SF-Pro-Text',
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xfffb8e28),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        child: BlocProvider(
          create: (context) => TravelAppBloc(),
          child: const Scaffold(
            backgroundColor: Color(0xffFCEFE3),
            body: SafeArea(bottom: false, child: _TravelHomeBody()),
            extendBody: true,
            bottomNavigationBar: _BottomBar(),
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      height: size.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300),
        color: const Color(0xfff37f10),
      ),
      child: Row(
        children: [
          const _BottomBarItem(icon: 'assets/travel_app/explore.svg', isSelected: true),
          const _BottomBarItem(icon: 'assets/travel_app/star.svg'),
          const _BottomBarItem(icon: 'assets/travel_app/profile.svg'),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({
    Key? key,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * .05,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(300), color: isSelected ? Colors.white : Colors.transparent),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.fitHeight,
          height: size.height * .025,
        ),
      ),
    );
  }
}

class _TravelHomeBody extends StatelessWidget {
  const _TravelHomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundRoundedContainer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _TopAppBar(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Text(
                'New Articles',
                style: TextStyle(color: Color(0xff321F0E), fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            const _CountryTopSelection(),
            const _SearchFilter(),
            const _CountryTravelCarousel(),
            SizedBox(height: MediaQuery.of(context).size.height * .11)
          ],
        )
      ],
    );
  }
}

class _CountryTopSelection extends StatefulWidget {
  const _CountryTopSelection({
    Key? key,
  }) : super(key: key);

  @override
  __CountryTopSelectionState createState() => __CountryTopSelectionState();
}

class __CountryTopSelectionState extends State<_CountryTopSelection> {
  final ScrollController scrollController = ScrollController();
  double lastPosition = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TravelAppBloc>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocConsumer<TravelAppBloc, TravelAppState>(
        listener: (context, state) {
          if (state is TravelAppUpdateTopScrollPositionState) {
            scrollController
                .animateTo(
                  state.position.toDouble() * MediaQuery.of(context).size.height * .13,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                )
                .then((value) => bloc.finishUpdateCountry());
          }
        },
        builder: (context, state) {
          return ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: bloc.countries.length,
            itemBuilder: (context, index) => _CountryOptionTab(
              country: bloc.countries[index],
              isSelected: bloc.countries[index].name == bloc.selectedCountry.name,
              onChange: () {
                scrollController.animateTo(
                  index.toDouble() * MediaQuery.of(context).size.height * .13,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
                bloc.changeCountry(bloc.countries[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class _CountryTravelCarousel extends StatefulWidget {
  const _CountryTravelCarousel({
    Key? key,
  }) : super(key: key);

  @override
  __CountryTravelCarouselState createState() => __CountryTravelCarouselState();
}

class __CountryTravelCarouselState extends State<_CountryTravelCarousel> {
  final PageController pageController = PageController(viewportFraction: .83, initialPage: 0);
  double lastPosition = 0.0;
  bool enableChangeScrollPosition = true;
  @override
  void initState() {
    super.initState();
    pageController.addListener(listener);
  }

  void listener() {
    lastPosition = pageController.page!;
    setState(() {});
  }

  @override
  void dispose() {
    pageController.removeListener(listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TravelAppBloc>();
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: BlocConsumer<TravelAppBloc, TravelAppState>(
        listener: (context, state) {
          if (state is TravelAppUpdateCarouselScrollPositionState) {
            pageController
                .animateToPage(state.position, duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
                .then((value) => bloc.finishUpdateCountry());
          }
        },
        builder: (context, state) {
          return PageView.builder(
            controller: pageController,
            itemCount: bloc.countries.length,
            onPageChanged: (index) => bloc.changeCountry(bloc.countries[index], isCarousel: true),
            itemBuilder: (context, index) {
              final country = bloc.countries[index];
              var scale = lerpDouble(1, .9, index - lastPosition) ?? 0.0;
              // print('index: $index');
              // print('scale: $scale');
              if (scale > 1.0) {
                scale = 2 - scale;
              }
              return GestureDetector(
                onTap: () {
                  if (pageController.page == index.toDouble()) {
                    Navigator.of(context).pushNamed(Routes.travelCountryDetails, arguments: country);
                  } else {
                    bloc.changeCountry(bloc.countries[index], isCarousel: true);
                    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  }
                },
                child: Transform(
                  transform: Matrix4.identity()..scale(scale),
                  alignment: Alignment.center,
                  child: Align(
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'country-${country.name}',
                          child: Container(
                            height: size.height * .55,
                            width: size.width * .9,
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              image: DecorationImage(image: AssetImage(country.image), fit: BoxFit.fitHeight),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Hero(
                            tag: 'country-trip-${country.name}',
                            flightShuttleBuilder: _flightShuttleBuilder,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    country.reviewDetail.title,
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                                  ),
                                  Text(
                                    country.reviewDetail.description,
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: MediaQuery.of(context).size.height * .015,
                                        backgroundImage: AssetImage(country.reviewerPhoto),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        country.reviewer,
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}

class _SearchFilter extends StatelessWidget {
  const _SearchFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(left: 20.0, right: 5.0, top: 10.0, bottom: 10.0),
            height: size.height * .06,
            decoration: BoxDecoration(
              color: const Color(0xffFAE5D2),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/travel_app/search.svg'),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search country or list',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xffEDA47E), fontSize: 15, fontFamily: 'SF-Pro-Text'),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 5.0, right: 20.0, top: 10.0, bottom: 10.0),
          height: size.height * .06,
          width: size.height * .06,
          decoration: BoxDecoration(
            color: const Color(0xffFAE5D2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SvgPicture.asset('assets/travel_app/filter.svg'),
        ),
      ],
    );
  }
}

class _CountryOptionTab extends StatelessWidget {
  const _CountryOptionTab({
    Key? key,
    required this.country,
    required this.isSelected,
    required this.onChange,
  }) : super(key: key);

  final Country country;
  final bool isSelected;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.red : Colors.transparent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(3.0),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            width: MediaQuery.of(context).size.height * .13,
            height: isSelected ? MediaQuery.of(context).size.height * .15 : MediaQuery.of(context).size.height * .13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: AssetImage(country.image), fit: BoxFit.fill),
            ),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                country.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  const _TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _ProfileAvatar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME BACK',
                style: TextStyle(color: const Color(0xff321F0E).withOpacity(.6), fontWeight: FontWeight.w600, fontSize: 12),
              ),
              const Text(
                'Ariana Grinder',
                style: TextStyle(color: Color(0xff321F0E), fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * .027,
            backgroundImage: const AssetImage('assets/travel_app/avatar.jpg'),
          ),
          Positioned(
            right: -size.height * .005,
            bottom: -size.height * .005,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFCEFE3),
              ),
              width: size.height * .03,
              height: size.height * .03,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xffFB8D27), Color(0xffFECA2F)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                width: size.height * .02,
                height: size.height * .02,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundRoundedContainer extends StatelessWidget {
  const _BackgroundRoundedContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(39),
            topRight: Radius.circular(39),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xffFB8D27),
              Color(0xffFECA2F),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
