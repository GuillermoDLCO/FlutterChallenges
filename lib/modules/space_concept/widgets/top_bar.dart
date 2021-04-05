import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: SvgPicture.asset('assets/space_concept/menu.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Space',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Mark', color: Colors.white),
              ),
              const Text(
                'Element',
                style: TextStyle(fontSize: 25, fontFamily: 'Mark', color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
