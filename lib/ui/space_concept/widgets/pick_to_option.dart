import 'package:flutter/material.dart';

class PickToExplore extends StatelessWidget {
  const PickToExplore({
    Key? key,
    required this.number,
    required this.action,
    this.marginPosition,
    this.radius = 15.0,
  }) : super(key: key);
  final int number;
  final VoidCallback action;
  final EdgeInsets? marginPosition;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginPosition,
      child: GestureDetector(
        onTap: action,
        child: Hero(
          tag: '$number',
          child: CircleAvatar(
            backgroundColor: const Color(0xffB1B0DF).withOpacity(.8),
            radius: radius,
            child: Text(
              '$number',
              style: const TextStyle(fontSize: 16, fontFamily: 'Mark', color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
