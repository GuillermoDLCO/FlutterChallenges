import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/facebook_redesign/blocs/theme_bloc.dart';
import 'package:flutterchallenges/navigation/routes.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => ThemeBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.theme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (RouteSettings settings) => Routes.routes(settings),
        );
      },
    );
  }
}
