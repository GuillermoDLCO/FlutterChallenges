import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarAppItem {
  const BottomBarAppItem({
    required this.icon,
    this.hasNotification = false,
  });

  final String icon;
  final bool hasNotification;
}

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({
    super.key,
    required this.items,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
    this.selectedIndex = 0,
  });
  final List<BottomBarAppItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => BottomBarAppState();
}

class BottomBarAppState extends State<BottomBarApp> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
      child: BottomAppBar(
        elevation: 5,
        color: widget.backgroundColor,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.items.length, (int index) {
              return TabItemBottomBar(
                item: widget.items[index],
                index: index,
                color: widget.selectedIndex == index
                    ? widget.selectedColor
                    : widget.color,
                onPressed: (int index) => widget.onTabSelected(index),
                height: widget.height,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class TabItemBottomBar extends StatelessWidget {
  const TabItemBottomBar({
    super.key,
    required this.item,
    required this.index,
    required this.onPressed,
    required this.color,
    required this.height,
  });

  final BottomBarAppItem item;
  final int index;
  final ValueChanged<int> onPressed;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  item.icon,
                  height: 25,
                  fit: BoxFit.cover,
                  color: color,
                ),
                if (item.hasNotification)
                  Positioned(
                    right: size.width * .04,
                    top: size.width * .035,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                      width: size.width * .035,
                      height: size.width * .035,
                      alignment: Alignment.center,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        width: size.width * .025,
                        height: size.width * .025,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
