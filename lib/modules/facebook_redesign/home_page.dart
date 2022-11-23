import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/avatar_profile.dart';
import 'package:flutterchallenges/modules/facebook_redesign/widgets/top_bar_app.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBarApp(),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              _ScrollStories(),
              _NewsSection(),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewsSection extends StatelessWidget {
  const _NewsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PostCard(
          userName: 'Daniela Fernández Ramos',
          userImage: 'assets/facebook_redesign/stories_3.png',
          postDescription:
              'Me encanto la sesión de fotos que me hizo mi amigo 😍🥺',
          postImage: 'assets/facebook_redesign/post_1.png',
        ),
        _PostCard(
          userName: 'James Sanchez',
          userImage: 'assets/facebook_redesign/stories_4.png',
          postDescription:
              'Me encanto la sesión de fotos de mi mejor amiga 😍🥺',
          postImage: 'assets/facebook_redesign/stories_3.png',
        ),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required this.userName,
    required this.userImage,
    required this.postDescription,
    required this.postImage,
  });

  final String userName;
  final String userImage;
  final String postDescription;
  final String postImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: theme.primaryColor,
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AvatarProfile(radius: size.width * .044, image: userImage),
              const SizedBox(width: 10),
              _TopInformationAndActionButtons(name: userName),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            postDescription,
            style: TextStyle(
              color: theme.textTheme.bodyText1?.color,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(postImage),
          ),
          const SizedBox(height: 10),
          const _PostInteractionBar(),
          Divider(
            color: const Color(0xff707070).withOpacity(.2),
            thickness: 1,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarProfile(
                  radius: size.width * .03,
                  image: 'assets/facebook_redesign/stories_2.png',
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michael Bruno',
                      style: TextStyle(
                        color: theme.textTheme.bodyText1?.color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Esta foto esta muy cool, deberías ser modelo',
                      style: TextStyle(
                        color: theme.textTheme.bodyText2?.color,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        _TextButtonCustom(label: 'Me gusta'),
                        _TextButtonCustom(label: 'Responder'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TextButtonCustom extends StatelessWidget {
  const _TextButtonCustom({
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xff2D3F7B),
          padding: const EdgeInsets.only(left: 2),
          alignment: Alignment.centerLeft,
          textStyle: const TextStyle(fontSize: 11),
        ),
        child: Text(label),
      ),
    );
  }
}

class _PostInteractionBar extends StatelessWidget {
  const _PostInteractionBar();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '30 comentarios · 5 compartidos',
          style:
              TextStyle(color: theme.textTheme.bodyText2?.color, fontSize: 12),
        ),
        Row(
          children: [
            const _SocialButtons(),
            const Spacer(),
            Text(
              'Mao Lop y 50 personas más',
              style: TextStyle(
                color: theme.textTheme.bodyText2?.color,
                fontSize: 11,
              ),
            ),
            Container(
              width: size.width * .1,
              alignment: Alignment.centerRight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: size.width * .04,
                    child: SvgPicture.asset(
                      'assets/facebook_redesign/like_circle.svg',
                      width: size.width * .05,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/facebook_redesign/loved_circle.svg',
                    width: size.width * .05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TopInformationAndActionButtons extends StatelessWidget {
  const _TopInformationAndActionButtons({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: theme.textTheme.bodyText1?.color,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/facebook_redesign/globe.svg',
                    width: size.width * .025,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Hace 3 días',
                    style: TextStyle(
                      color: theme.textTheme.bodyText2?.color,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          _ActionButton(
            icon: 'assets/facebook_redesign/star.svg',
            enableTheme:
                context.watch<ThemeBloc>().state.appThemeType == AppTheme.dark,
          ),
          const SizedBox(width: 10),
          _ActionButton(
            icon: 'assets/facebook_redesign/more_options.svg',
            enableTheme:
                context.watch<ThemeBloc>().state.appThemeType == AppTheme.dark,
          ),
        ],
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _PostSocialButton(icon: 'assets/facebook_redesign/like.svg'),
        SizedBox(width: 5),
        _PostSocialButton(icon: 'assets/facebook_redesign/comment.svg'),
        SizedBox(width: 5),
        _PostSocialButton(icon: 'assets/facebook_redesign/share.svg'),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.enableTheme,
  });

  final String icon;
  final bool enableTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: theme.colorScheme.primary,
          radius: size.width * .03,
          child: SvgPicture.asset(
            icon,
            width: size.width * .03,
            color: enableTheme ? theme.colorScheme.secondary : null,
          ),
        ),
      ],
    );
  }
}

class _PostSocialButton extends StatelessWidget {
  const _PostSocialButton({
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: theme.bottomAppBarColor,
          radius: size.width * .04,
          child: SvgPicture.asset(
            icon,
            width: size.width * .04,
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class _ScrollStories extends StatelessWidget {
  const _ScrollStories();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .12,
      margin: const EdgeInsets.only(top: 22),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 15),
          _PersonalStory(),
          _FriendStory(
            profileImage: 'assets/facebook_redesign/stories_2.png',
            storyImage: 'assets/facebook_redesign/stories_2.png',
            name: 'Fernando',
          ),
          _FriendStory(
            profileImage: 'assets/facebook_redesign/stories_3.png',
            storyImage: 'assets/facebook_redesign/stories_3.png',
            name: 'Andrea',
          ),
          _FriendStory(
            profileImage: 'assets/facebook_redesign/stories_4.png',
            storyImage: 'assets/facebook_redesign/stories_4.png',
            name: 'James',
          ),
          _FriendStory(
            profileImage: 'assets/facebook_redesign/stories_5.png',
            storyImage: 'assets/facebook_redesign/stories_5.png',
            name: 'Fanny',
          ),
          _FriendStory(
            profileImage: 'assets/facebook_redesign/stories_6.png',
            storyImage: 'assets/facebook_redesign/stories_6.png',
            name: 'Estefania',
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class _PersonalStory extends StatelessWidget {
  const _PersonalStory();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .08,
                width: size.height * .08,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/facebook_redesign/stories_1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Positioned(
                bottom: -10,
                child: SvgPicture.asset(
                  'assets/facebook_redesign/add_story.svg',
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .01 + 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Crear historia',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FriendStory extends StatelessWidget {
  const _FriendStory({
    required this.profileImage,
    required this.storyImage,
    required this.name,
  });

  final String profileImage;
  final String storyImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: size.height * .08,
                width: size.height * .08,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(storyImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Positioned(
                bottom: -10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xff1977F3), width: 1.5),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .01 + 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
