import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/profile_page.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/avatar_profile.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class TopBarApp extends StatelessWidget {
  const TopBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: theme.primaryColor,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 10),
      child: Column(
        children: [
          const _AppBarCustom(),
          Divider(
            color: const Color(0xff707070).withOpacity(.2),
            thickness: 1,
            height: 30,
          ),
          const _CreatePostContainer(),
        ],
      ),
    );
  }
}

class _CreatePostContainer extends StatelessWidget {
  const _CreatePostContainer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            AvatarProfile(
              radius: size.width * .042,
              image: 'assets/facebook_redesign/stories_1.png',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '¿Qué estas pensando, Mao?',
                  style: TextStyle(
                    color: theme.textTheme.bodyText2?.color,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/facebook_redesign/smile.svg',
              width: size.width * .05,
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _PostTypeButton(
              icon: 'assets/facebook_redesign/camera.svg',
              label: 'Fotos',
            ),
            _PostTypeButton(
              icon: 'assets/facebook_redesign/video.svg',
              label: 'En vivo',
            ),
            _PostTypeButton(
              icon: 'assets/facebook_redesign/view.svg',
              label: 'Video corto',
            ),
          ],
        )
      ],
    );
  }
}

class _PostTypeButton extends StatelessWidget {
  const _PostTypeButton({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: theme.colorScheme.primary,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: size.width * .04),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: theme.textTheme.bodyText1?.color,
              fontSize: 12,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarCustom extends StatelessWidget {
  const _AppBarCustom();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/facebook_redesign/facebook_logo.svg',
          width: MediaQuery.of(context).size.width * .08,
        ),
        const Spacer(),
        const _ActionButton(icon: 'assets/facebook_redesign/search.svg'),
        const SizedBox(width: 12),
        const _ActionButton(
          icon: 'assets/facebook_redesign/notifications.svg',
          hasNotification: true,
        ),
        const SizedBox(width: 12),
        _ActionButton(
          icon: 'assets/facebook_redesign/messenger.svg',
          enableTheme:
              context.watch<ThemeBloc>().state.appThemeType == AppTheme.dark,
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => const ProfilePage(),
            ),
          ),
          child: AvatarProfile(
            radius: MediaQuery.of(context).size.width * .042,
            image: 'assets/facebook_redesign/stories_1.png',
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    this.enableTheme = true,
    this.hasNotification = false,
  });

  final String icon;
  final bool enableTheme;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.primary,
          child: SvgPicture.asset(
            icon,
            width: size.width * .04,
            color: enableTheme ? theme.colorScheme.secondary : null,
          ),
        ),
        if (hasNotification)
          Positioned(
            right: size.width * .01,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              width: size.width * .03,
              height: size.width * .03,
            ),
          )
      ],
    );
  }
}
