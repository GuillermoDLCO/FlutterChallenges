import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/travel_app/country.dart';

class TravelCountryDetails extends StatelessWidget {
  const TravelCountryDetails({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'SF-Pro-Text',
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _BodyTravelCountryDetails(country: country),
        ),
      ),
    );
  }
}

class _BodyTravelCountryDetails extends StatelessWidget {
  const _BodyTravelCountryDetails({
    required this.country,
  });

  final Country country;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: CustomSliverAppBar(
            country: country,
            expandedHeight: size.height * .5,
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => _CategoryOption(
                      isFirst: index == 0,
                      category: categories[index],
                      isFinal: index == categories.length - 1,
                      isSelected: index == 0,
                    ),
                  ),
                ),
                _ReviewContent(country: country),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _ReviewContent extends StatelessWidget {
  const _ReviewContent({
    required this.country,
  });

  final Country country;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            country.reviewDetail.reviewSubtitle,
            style: const TextStyle(
              color: Color(0xff081414),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            country.reviewDetail.reviewContentSubtitle,
            style: TextStyle(
              color: const Color(0xff081414).withOpacity(.6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                _IconInformation(
                  icon: 'assets/travel_app/location.svg',
                  value: country.reviewDetail.location,
                ),
                const SizedBox(width: 10),
                _IconInformation(
                  icon: 'assets/travel_app/heart.svg',
                  value: '${country.reviewDetail.likes} likes',
                ),
                const SizedBox(width: 10),
                _IconInformation(
                  icon: 'assets/travel_app/show_eye.svg',
                  value: '${country.reviewDetail.views} view',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  _HotelInformation(
                    height: size.width * .5,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[0],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .5,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[1],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .5,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[2],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .5,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[1],
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[1],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[2],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[0],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[1],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[2],
                  ),
                  const SizedBox(height: 10),
                  _HotelInformation(
                    height: size.width * .3,
                    width: size.width * .4,
                    hotel: country.reviewDetail.hotels[0],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HotelInformation extends StatelessWidget {
  const _HotelInformation({
    required this.height,
    required this.width,
    required this.hotel,
  });

  final double height;
  final double width;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(hotel.image),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'From \$${hotel.price} night',
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconInformation extends StatelessWidget {
  const _IconInformation({
    required this.icon,
    required this.value,
  });

  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 20,
          color: const Color(0xff132D2F).withOpacity(.6),
        ),
        const SizedBox(width: 2),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xff132D2F).withOpacity(.6),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _CategoryOption extends StatelessWidget {
  const _CategoryOption({
    this.isFirst = false,
    this.isFinal = false,
    required this.isSelected,
    required this.category,
  });

  final bool isFirst;
  final bool isFinal;
  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isFirst ? const Color(0xff132D2F) : const Color(0xffFBFCF9),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4A4D45).withOpacity(.2),
            blurRadius: 7,
            spreadRadius: 2,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(
        right: isFinal ? 20.0 : 5.0,
        bottom: 5,
        top: 5,
        left: isFirst ? 20.0 : 5.0,
      ),
      alignment: Alignment.center,
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xff132D2F),
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  CustomSliverAppBar({
    required this.country,
    required this.expandedHeight,
  });

  final Country country;
  final double expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Hero(
            tag: 'country-${country.name}',
            child: Image.asset(country.image, fit: BoxFit.fitWidth),
          ),
        ),
        SafeArea(
          child: Center(
            child: Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Text(
                country.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: (1 - shrinkOffset * 2 / expandedHeight).clamp(0.0, 1.0),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: (1 - shrinkOffset * 2 / expandedHeight == 1.0)
                    ? () => Navigator.of(context).pop()
                    : null,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/travel_app/arrow_left.svg'),
                      const SizedBox(width: 10),
                      const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: (1 - shrinkOffset * 2 / expandedHeight).clamp(0.0, 1.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Hero(
              tag: 'country-trip-${country.name}',
              flightShuttleBuilder: _flightShuttleBuilder,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: size.width * .7,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.reviewDetail.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              country.reviewDetail.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: size.height * .015,
                                  backgroundImage:
                                      AssetImage(country.reviewerPhoto),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  country.reviewer,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          width: size.width * .1,
                          height: size.width * .1,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/travel_app/heart.svg',
                            fit: BoxFit.fitWidth,
                            width: size.width * .1,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // TODO: remove boiderplate
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

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
