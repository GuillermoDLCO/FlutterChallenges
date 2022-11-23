import 'package:flutter/material.dart';

class BottomAppBarItem {
  BottomAppBarItem(this.icon, this.text);
  IconData icon;
  String text;
}

class BottomAppBarCustom extends StatefulWidget {
  const BottomAppBarCustom({
    super.key,
    required this.items,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    this.selectedIndex = 0,
  }) : assert(
          items.length == 2 || items.length == 4,
          'Length not equal to 2 or 4',
        );

  final List<BottomAppBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => BottomAppBarCustomState();
}

class BottomAppBarCustomState extends State<BottomAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: widget.notchedShape,
      elevation: 5,
      notchMargin: 10,
      color: widget.backgroundColor,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (int index) {
            return TabItemBottomBar(
              item: widget.items[index],
              index: index,
              iconSize: widget.iconSize,
              color: widget.selectedIndex == index
                  ? widget.selectedColor
                  : widget.color,
              onPressed: (int index) => widget.onTabSelected(index),
              height: widget.height,
            );
          })
            ..insert(
              widget.items.length >> 1,
              _MiddleTabItem(height: widget.height),
            ),
        ),
      ),
    );
  }
}

class _MiddleTabItem extends StatelessWidget {
  const _MiddleTabItem({
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(height: height),
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
    required this.iconSize,
  });

  final BottomAppBarItem item;
  final int index;
  final ValueChanged<int> onPressed;
  final Color color;
  final double height;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.icon, size: iconSize, color: color),
                const SizedBox(height: 2),
                FittedBox(
                  child: Text(
                    item.text,
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
