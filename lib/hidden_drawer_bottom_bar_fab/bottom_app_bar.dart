import 'package:flutter/material.dart';

class BottomAppBarItem {
  BottomAppBarItem({this.icon, this.text});
  IconData icon;
  String text;
}

class BottomAppBarCustom extends StatefulWidget {
  BottomAppBarCustom({
    this.items,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.selectedIndex = 0,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
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
      notchMargin: 10.0,
      child: Container(
        height: 65.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (int index) {
            return TabItemBottomBar(
              item: widget.items[index],
              index: index,
              iconSize: widget.iconSize,
              color: widget.selectedIndex == index ? widget.selectedColor : widget.color,
              onPressed: (int index) => widget.onTabSelected(index),
              height: widget.height,
            );
          })
            ..insert(widget.items.length >> 1, _MiddleTabItem(height: widget.height)),
        ),
      ),
      color: widget.backgroundColor,
    );
  }
}

class _MiddleTabItem extends StatelessWidget {
  const _MiddleTabItem({
    Key key,
    @required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(height: this.height),
    );
  }
}

class TabItemBottomBar extends StatelessWidget {
  const TabItemBottomBar({
    Key key,
    @required this.item,
    @required this.index,
    @required this.onPressed,
    @required this.color,
    @required this.height,
    @required this.iconSize,
  })  : assert(item != null),
        assert(index != null),
        assert(onPressed != null),
        assert(color != null),
        assert(height != null),
        assert(iconSize != null),
        super(key: key);

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
                const SizedBox(height: 2.0),
                FittedBox(child: Text(item.text, style: TextStyle(color: color, fontSize: 12.0))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
