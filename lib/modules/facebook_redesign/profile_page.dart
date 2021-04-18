import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/avatar_profile.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeBloc = context.watch<ThemeBloc>();
    final isLight = themeBloc.state.appThemeType == AppTheme.Light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: isLight ? Colors.white : theme.bottomAppBarColor,
        systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: const _ProfileBody(),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              height: size.height * .3,
              width: double.infinity,
              child: Image.asset('assets/facebook_redesign/banner.png', fit: BoxFit.fitHeight),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    height: size.width * .08,
                    width: size.width * .08,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: theme.hoverColor),
                    padding: const EdgeInsets.only(right: 2),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/facebook_redesign/ios_arrow_back.svg', color: Colors.white, width: size.width * .02)),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    height: size.width * .08,
                    width: size.width * .08,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: theme.hoverColor),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/facebook_redesign/search.svg', color: Colors.white, width: size.width * .03)),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height * .7,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                  color: theme.primaryColor,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: size.height * .1),
                    Column(
                      children: [
                        Text(
                          'Mao Lop',
                          style: TextStyle(color: theme.textTheme.bodyText1?.color, fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const _TextInformation(text: 'Mauricio Lopez'),
                            const _VerticalDivider(),
                            const _TextInformation(text: 'Diseñador UI/UX'),
                            const _VerticalDivider(),
                            const _TextInformation(text: 'Developer'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff1977F3),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                                minimumSize: const Size(105, 34),
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/facebook_redesign/messenger.svg', color: Colors.white),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'Mensaje',
                                    style: TextStyle(color: Colors.white, fontSize: 15, height: 1.3),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                                side: BorderSide(color: theme.highlightColor, style: BorderStyle.solid, width: 1.0),
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              ),
                              child: Text(
                                'Llamar',
                                style: TextStyle(color: theme.highlightColor, fontSize: 15, height: 1.3),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffE2E2E2)),
                                shape: BoxShape.circle,
                                color: theme.primaryColor,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: SvgPicture.asset('assets/facebook_redesign/more_options.svg', fit: BoxFit.cover),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(color: const Color(0xff707070).withOpacity(.3), thickness: 1.0, height: 30.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const _BasicInformationText(icon: 'assets/facebook_redesign/home.svg', text: 'Vive en Zihuatanejo, Guerrero, México.'),
                              const _BasicInformationText(icon: 'assets/facebook_redesign/clock.svg', text: 'Se unió en: Septiembre de 2010'),
                              const _BasicInformationText(icon: 'assets/facebook_redesign/information.svg', text: 'Ver más información de Mao'),
                            ],
                          ),
                        ),
                        const _ScrollCollections(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(color: const Color(0xff707070).withOpacity(.3), thickness: 0.7, height: 10.0),
                        ),
                        const _FriendsSection(),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -size.height * .14,
                child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff1977F3)),
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarProfile(radius: size.height * .1, image: 'assets/facebook_redesign/stories_1.png')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FriendsSection extends StatelessWidget {
  const _FriendsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Amigos',
                style: TextStyle(color: theme.textTheme.bodyText1?.color, fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(width: 5),
              Text(
                '(2,004 amigos)',
                style: TextStyle(color: theme.textTheme.bodyText2?.color, fontSize: 19),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: const Color(0xff1977F3),
                  padding: const EdgeInsets.only(left: 2),
                  alignment: Alignment.centerLeft,
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: const Text('Ver todos'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _FriendAvatar(profileImage: 'assets/facebook_redesign/stories_2.png', name: 'Wilber Garcia'),
              const _FriendAvatar(profileImage: 'assets/facebook_redesign/stories_4.png', name: 'Michael Gais'),
              const _FriendAvatar(profileImage: 'assets/facebook_redesign/stories_3.png', name: 'Daniela López'),
              const _FriendAvatar(profileImage: 'assets/facebook_redesign/stories_6.png', name: 'Sarai Perez'),
            ],
          )
        ],
      ),
    );
  }
}

class _ScrollCollections extends StatelessWidget {
  const _ScrollCollections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .17,
      margin: const EdgeInsets.only(top: 22.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 15.0),
          const _CollectionCard(
            profileImage: 'assets/facebook_redesign/stories_1.png',
            name: 'Colección',
          ),
          const _CollectionCard(
            profileImage: 'assets/facebook_redesign/stories_5.png',
            name: 'Colección',
          ),
          const _CollectionCard(
            profileImage: 'assets/facebook_redesign/stories_4.png',
            name: 'Colección',
          ),
          const _CollectionCard(
            profileImage: 'assets/facebook_redesign/stories_5.png',
            name: 'Colección',
          ),
          const _CollectionCard(
            profileImage: 'assets/facebook_redesign/stories_6.png',
            name: 'Colección',
          ),
          const SizedBox(width: 15.0),
        ],
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  const _CollectionCard({
    Key? key,
    required this.profileImage,
    required this.name,
  }) : super(key: key);

  final String profileImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .13,
                width: size.height * .1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(profileImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class _FriendAvatar extends StatelessWidget {
  const _FriendAvatar({
    Key? key,
    required this.profileImage,
    required this.name,
  }) : super(key: key);

  final String profileImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .1,
                width: size.height * .1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profileImage),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}

class _BasicInformationText extends StatelessWidget {
  const _BasicInformationText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: size.width * .03, color: const Color(0xffC5CBDD)),
          const SizedBox(width: 10.0),
          Text(
            text,
            style: TextStyle(color: theme.textTheme.bodyText1?.color, fontSize: 14, height: 1.3),
          ),
        ],
      ),
    );
  }
}

class _TextInformation extends StatelessWidget {
  const _TextInformation({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: TextStyle(color: theme.textTheme.bodyText2?.color, fontSize: 15),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(width: 1.0, height: 20.0, color: const Color(0xff707070).withOpacity(.2)),
    );
  }
}
