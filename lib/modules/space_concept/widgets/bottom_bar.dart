import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: const Color(0xff201E39).withOpacity(.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/space_concept/explore_icon.svg'),
          SvgPicture.asset('assets/space_concept/planet_icon.svg'),
          SvgPicture.asset('assets/space_concept/profile_icon.svg'),
        ],
      ),
    );
  }
}
