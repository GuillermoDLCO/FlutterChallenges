import 'package:flutter/material.dart';

import 'package:flutterchallenges/hidden_drawer_bottom_bar_fab/multiple_fab.dart';
import 'package:flutterchallenges/res/pallete_color.dart';

import 'bottom_app_bar.dart';

class HiddenMenuBottomBarFab extends StatefulWidget {
  @override
  _HiddenMenuBottomBarFabState createState() => _HiddenMenuBottomBarFabState();
}

class _HiddenMenuBottomBarFabState extends State<HiddenMenuBottomBarFab> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 400);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  double xOffset = 0;
  int currentIndex = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool _roundCornersForm = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double initial = 0;
    double distance = 0;
    return Container(
        color: isCollapsed ? Colors.white : PalleteColor.backgroundMenuDrawerColor,
        child: SafeArea(
          child: GestureDetector(
            onPanStart: (DragStartDetails details) {
              initial = details.globalPosition.dx;
            },
            onPanUpdate: (DragUpdateDetails details) {
              distance = details.globalPosition.dx - initial;
            },
            onPanEnd: (DragEndDetails details) {
              initial = 0.0;
              if (distance > 180 && isCollapsed) openMenuDrawer();
              if (distance < -180 && !isCollapsed) openMenuDrawer();
              debugPrint('$distance');
            },
            child: Scaffold(
              backgroundColor: PalleteColor.backgroundMenuDrawerColor,
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    _MenuDrawer(),
                    AnimatedContainer(
                      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
                      duration: Duration(milliseconds: 250),
                      onEnd: () {
                        if (isCollapsed)
                          setState(() {
                            _roundCornersForm = false;
                          });
                      },
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(_roundCornersForm ? 40.0 : 0.0),
                          child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(top: _roundCornersForm ? 8.0 : 0.0),
                              child: Scaffold(
                                extendBody: true,
                                body: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    IndexedStack(
                                      index: currentIndex,
                                      children: [
                                        _IndexedPages(backgroundColor: Colors.green, title: 'Page One'),
                                        _IndexedPages(backgroundColor: Colors.blue, title: 'Page Two'),
                                        _IndexedPages(backgroundColor: Colors.grey, title: 'Page Three'),
                                        _IndexedPages(backgroundColor: Colors.brown, title: 'Page Four'),
                                      ],
                                    ),
                                    Positioned(bottom: 4.0, child: _FloatingActionButtonCustom()),
                                  ],
                                ),
                                floatingActionButton: IgnorePointer(
                                    child: SizedBox(
                                  width: 50.0,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    heroTag: null,
                                    foregroundColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                  ),
                                )),
                                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                                bottomNavigationBar: _BottomBarCustom(
                                  currentIndex: currentIndex,
                                  updateIndex: (index) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void openMenuDrawer() {
    setState(() {
      if (isCollapsed) {
        xOffset = 230;
        _roundCornersForm = true;
        yOffset = 150;
        scaleFactor = 0.6;
        _controller.forward();
      } else {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;
    });
  }
}

class _MenuDrawer extends StatelessWidget {
  const _MenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColor.backgroundMenuDrawerColor,
      body: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Sets", style: TextStyle(color: Colors.white, fontSize: 22)),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                            Icon(Icons.details, color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: _OptionMenuDrawer(
                            title: 'Initiatives',
                            icon: Icon(
                              Icons.check_box_outline_blank,
                              size: 25,
                              color: PalleteColor.actionButtonColor,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: _OptionMenuDrawer(
                              title: 'Contacts',
                              icon: Icon(
                                Icons.people,
                                size: 25,
                                color: PalleteColor.actionButtonColor,
                              ),
                            )),
                        _OptionMenuDrawer(title: 'Tokens'),
                        GestureDetector(
                          onTap: () {},
                          child: _OptionMenuDrawer(
                            title: 'My Credentials',
                            icon: Icon(
                              Icons.chrome_reader_mode,
                              size: 25,
                              color: PalleteColor.actionButtonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  _OptionMenuDrawer(
                    title: 'Invite',
                    backgroundColorIcon: Colors.transparent,
                    icon: Icon(
                      Icons.person_add,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  _OptionMenuDrawer(
                    title: 'Messages',
                    backgroundColorIcon: Colors.transparent,
                    icon: Icon(
                      Icons.textsms,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  _OptionMenuDrawer(
                    title: 'Points',
                    backgroundColorIcon: Colors.transparent,
                    icon: Icon(
                      Icons.card_giftcard,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(radius: 20.0, child: Icon(Icons.account_circle)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('GuillermoDLCO',
                                      overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0)),
                                  Text('Community', style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionMenuDrawer extends StatelessWidget {
  const _OptionMenuDrawer({
    Key key,
    @required this.title,
    this.icon,
    this.backgroundColorIcon = Colors.white,
  })  : assert(title != null),
        super(key: key);
  final String title;
  final Widget icon;
  final Color backgroundColorIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: backgroundColorIcon,
            radius: 20.0,
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.title,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

typedef OnUpdateIndex = Function(int index);

class _BottomBarCustom extends StatelessWidget {
  const _BottomBarCustom({
    Key key,
    @required this.currentIndex,
    @required this.updateIndex,
  })  : assert(currentIndex != null),
        assert(updateIndex != null),
        super(key: key);

  final int currentIndex;
  final OnUpdateIndex updateIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: PalleteColor.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(5.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 65, width: 85.0),
            Expanded(
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: PalleteColor.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(5.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomAppBarCustom(
            onTabSelected: updateIndex,
            notchedShape: CircularNotchedRectangle(),
            selectedIndex: currentIndex,
            backgroundColor: Colors.white,
            color: PalleteColor.actionButtonColor.withOpacity(0.5),
            selectedColor: PalleteColor.actionButtonColor,
            items: [
              BottomAppBarItem(
                icon: Icons.format_indent_increase,
                text: 'Campaign',
              ),
              BottomAppBarItem(
                icon: Icons.chrome_reader_mode,
                text: 'Credentials',
              ),
              BottomAppBarItem(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
              BottomAppBarItem(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _FloatingActionButtonCustom extends StatefulWidget {
  const _FloatingActionButtonCustom({
    Key key,
  }) : super(key: key);

  @override
  __FloatingActionButtonCustomState createState() => __FloatingActionButtonCustomState();
}

class __FloatingActionButtonCustomState extends State<_FloatingActionButtonCustom> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final Duration duration = const Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultipleFAB(
      controller: _controller,
      actionFirstButton: () {},
      backgroundColor: PalleteColor.actionButtonColor,
      icons: [
        Tooltip(
          message: 'Create Self-attested VC',
          child: GestureDetector(
            onTap: () => debugPrint('Tap Self-attested VC'),
            child: Icon(
              Icons.create_new_folder,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        Tooltip(
          message: 'Create credential',
          child: GestureDetector(
            onTap: () => debugPrint('Tap create credential'),
            child: Icon(Icons.credit_card, color: Colors.white, size: 25),
          ),
        ),
        Tooltip(
          message: 'Request VC',
          child: GestureDetector(
            onTap: () => debugPrint('Tap QR'),
            child: Icon(Icons.credit_card, color: Colors.white, size: 25),
          ),
        ),
        Tooltip(
          message: 'Scan a QR',
          child: GestureDetector(
            onTap: () => debugPrint('Tap QR'),
            child: Icon(Icons.code, color: Colors.white, size: 25),
          ),
        ),
      ],
    );
  }
}

class _IndexedPages extends StatelessWidget {
  const _IndexedPages({
    Key key,
    @required this.backgroundColor,
    @required this.title,
  })  : assert(backgroundColor != null),
        assert(title != null),
        super(key: key);
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.0),
        child: _CustomAppBar(title: title),
      ),
      backgroundColor: PalleteColor.backgroundColor,
      body: _BodyPage(),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      title: Text(
        '$title',
        style: TextStyle(color: PalleteColor.actionButtonColor, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 25,
          color: PalleteColor.actionButtonColor,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.format_align_center,
            size: 25,
            color: PalleteColor.actionButtonColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class _BodyPage extends StatelessWidget {
  const _BodyPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _SeachBar(),
        ],
      ),
    );
  }
}

class _SeachBar extends StatelessWidget {
  const _SeachBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 0.1),
            color: PalleteColor.backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, size: 20.0, color: Color(0xff8b8b8b)),
              ),
              Expanded(
                child: Container(
                  height: 30.0,
                  child: TextField(
                    onTap: () {},
                    autofocus: false,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.1)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.1)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.transparent, width: 0.1)),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Color(0xff8b8b8b),
                        fontSize: 11.0,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
              Icon(Icons.close, color: Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }
}
