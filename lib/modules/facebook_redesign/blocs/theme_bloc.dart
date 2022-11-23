import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/theme/app_theme.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            theme: appThemeData[AppTheme.normal]!,
            appThemeType: AppTheme.normal,
          ),
        );

  void changeTheme(AppTheme appTheme) {
    emit(ThemeState(theme: appThemeData[appTheme]!, appThemeType: appTheme));
  }
}

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
    required this.appThemeType,
  });
  final ThemeData theme;
  final AppTheme appThemeType;

  @override
  List<Object> get props => [theme, appThemeType];
}
