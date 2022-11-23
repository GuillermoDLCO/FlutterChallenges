import 'package:flutter/material.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    super.key,
    required this.radius,
    required this.image,
  });

  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(image),
    );
  }
}
