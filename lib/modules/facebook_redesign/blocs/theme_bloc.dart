import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutterchallenges/theme/app_theme.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeState(theme: appThemeData[AppTheme.Normal]!, appThemeType: AppTheme.Normal));

  void changeTheme(AppTheme appTheme) {
    emit(ThemeState(theme: appThemeData[appTheme]!, appThemeType: appTheme));
  }
}

class ThemeState extends Equatable {
  final ThemeData theme;
  final AppTheme appThemeType;

  const ThemeState({
    required this.theme,
    required this.appThemeType,
  });

  @override
  List<Object> get props => [theme, appThemeType];
}
