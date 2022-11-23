import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SvgPicture.asset('assets/space_concept/menu.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
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
    );
  }
}
