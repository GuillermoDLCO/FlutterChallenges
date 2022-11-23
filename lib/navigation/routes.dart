import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenges/modules/facebook_redesign/facebook_principal_screen.dart';
import 'package:flutterchallenges/modules/hidden_drawer_bottom_bar_fab/hidden_drawer_bottom_bar_fab_screen.dart';
import 'package:flutterchallenges/modules/home_screen.dart';
import 'package:flutterchallenges/modules/space_concept/space_concept_explore_planet_screen.dart';
import 'package:flutterchallenges/modules/space_concept/space_concept_intro_screen.dart';
import 'package:flutterchallenges/modules/space_concept/space_concept_onboarding_screen.dart';
import 'package:flutterchallenges/modules/space_concept/space_concept_principal_screen.dart';
import 'package:flutterchallenges/modules/travel_app/country.dart';
import 'package:flutterchallenges/modules/travel_app/travel_country_details_screen.dart';
import 'package:flutterchallenges/modules/travel_app/travel_home_screen.dart';

class Routes {
  static const initial = '/';
  static const hiddenDrawerBottomBarFab = '/hiddenDrawerBottomBarFab';
  static const spaceConceptOnboarding = '/spaceConceptOnboarding';
  static const spaceConceptIntro = '/spaceConceptIntro';
  static const spaceConceptPrincipal = '/spaceConceptPrincipal';
  static const spaceConceptExplorePlanet = '/spaceConceptExplorePlanet';
  static const travelApp = '/travelApp';
  static const travelCountryDetails = '/travelCountryDetails';
  static const facebookPrincipalScreen = '/facebookPrincipalScreen';

  static PageRouteBuilder<Widget> routes(RouteSettings routeSettings) {
    print('Route name: ${routeSettings.name}');
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initial:
        return _buildRoute(const HomeScreen());
      case hiddenDrawerBottomBarFab:
        return _buildRoute(const HiddenMenuBottomBarFab());
      case spaceConceptOnboarding:
        return _buildRoute(const SpaceConceptOnboardingScreen());
      case spaceConceptIntro:
        return _buildRoute(const SpaceConceptIntroScreen());
      case spaceConceptPrincipal:
        return _buildRoute(const SpaceConceptPrincipalScreen());
      case spaceConceptExplorePlanet:
        return _buildRoute(const SpaceConceptExplorePlanetScreen());
      case travelApp:
        return _buildRoute(const TravelHomeScreen());
      case travelCountryDetails:
        if (args == null) break;
        return _buildRoute(TravelCountryDetails(country: args as Country));
      case facebookPrincipalScreen:
        return _buildRoute(const FacebookPrincipalScreen());
      default:
    }

    throw PlatformException(
      code: 'ROUTE_ERROR',
      message: 'Route does not exists',
    );
  }

  static PageRouteBuilder<Widget> _buildRoute(Widget screen) {
    return PageRouteBuilder<Widget>(
      pageBuilder: (context, _, __) => screen,
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
