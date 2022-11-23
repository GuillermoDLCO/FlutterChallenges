import 'package:flutter/material.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';

class MultipleFAB extends StatefulWidget {
  const MultipleFAB({
    super.key,
    required this.icons,
    required AnimationController controller,
    required this.backgroundColor,
    required this.actionFirstButton,
  }) : _controller = controller;

  final List<Widget> icons;
  final AnimationController _controller;
  final Color backgroundColor;
  final VoidCallback actionFirstButton;

  @override
  State<MultipleFAB> createState() => _MultipleFABState();
}

class _MultipleFABState extends State<MultipleFAB> {
  late AnimationController animationController;
  late Animation<double> degOneTranslationAnimation;
  late Animation<double> degTwoTranslationAnimation;
  late Animation<double> degThreeTranslationAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> rotationAnimationPrincipalButton;

  @override
  void initState() {
    animationController = widget._controller;
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 75,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1),
        weight: 25,
      ),
    ]).animate(widget._controller);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 55,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1),
        weight: 45,
      ),
    ]).animate(widget._controller);
    rotationAnimation = Tween<double>(begin: 180, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    rotationAnimationPrincipalButton =
        Tween<double>(begin: 180, end: 45).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  double getRadiansFromIndex(int index, {bool is3items = false}) {
    const unitRadian = 57.295779513;
    double degree;
    switch (index) {
      case 0:
        degree = is3items ? 270.0 : 247.0;
        break;
      case 1:
        degree = is3items ? 220.0 : 293.0;
        break;
      case 2:
        degree = is3items ? 320.0 : 200;
        break;
      case 3:
        degree = 340.0;
        break;
      default:
        degree = 245.0;
    }
    return degree / unitRadian;
  }

  double getRadiansFromDegree(double degree) {
    const unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    final is3Widgets = widget.icons.length == 3;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: <Widget>[
        IgnorePointer(
          child: Container(
            // color: Colors.black.withOpacity(0.4),
            color: Colors.transparent,
            width: 130,
            height: 130,
          ),
        ),
        ...List.generate(widget.icons.length, (int index) {
          final Widget child = SizedBox(
            width: 40,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: widget.backgroundColor,
              onPressed: () {},
              child: widget.icons[index],
            ),
          );

          return Transform.translate(
            offset: Offset.fromDirection(
              getRadiansFromIndex(index, is3items: is3Widgets),
              degTwoTranslationAnimation.value * 60,
            ),
            child: Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degTwoTranslationAnimation.value),
              alignment: Alignment.center,
              child: child,
            ),
          );
        }).toList()
          ..add(
            Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimationPrincipalButton.value),
              ),
              alignment: Alignment.center,
              child: FloatingActionButton(
                heroTag: null,
                backgroundColor: PalleteColor.actionButtonColor,
                onPressed: () {
                  if (animationController.isDismissed) {
                    animationController.forward();
                  } else {
                    animationController.reverse();
                  }
                },
                child: const Icon(Icons.add, size: 30),
              ),
            ),
          )
      ],
    );
  }
}
