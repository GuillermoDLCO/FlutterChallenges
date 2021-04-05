import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutterchallenges/modules/travel_app/country.dart';

class TravelAppBloc extends Cubit<TravelAppState> {
  late List<Country> countries;
  late Country selectedCountry;
  bool enableChangeTopScrollPosition = true;

  TravelAppBloc() : super(TravelAppBlocInitialState()) {
    countries = countriesData;
    selectedCountry = countries.first;
  }

  void changeCountry(Country country, {bool isCarousel = false}) {
    if (enableChangeTopScrollPosition) {
      enableChangeTopScrollPosition = false;
      selectedCountry = country;
      final indexCountry = countries.indexWhere((element) => element.name == selectedCountry.name);
      if (isCarousel) {
        emit(TravelAppUpdateTopScrollPositionState(position: indexCountry));
      } else {
        emit(TravelAppUpdateCarouselScrollPositionState(position: indexCountry));
      }
      emit(TravelAppChangeCountryState(selectedCountry: selectedCountry));
    }
  }

  void finishUpdateCountry() {
    enableChangeTopScrollPosition = true;
  }
}

abstract class TravelAppState extends Equatable {
  const TravelAppState();

  @override
  List<Object> get props => [];
}

class TravelAppBlocInitialState extends TravelAppState {}

class TravelAppChangeCountryState extends TravelAppState {
  final Country selectedCountry;

  TravelAppChangeCountryState({required this.selectedCountry});

  @override
  List<Object> get props => [selectedCountry];
}

class TravelAppUpdateTopScrollPositionState extends TravelAppState {
  final int position;

  TravelAppUpdateTopScrollPositionState({required this.position});

  @override
  List<Object> get props => [position];
}

class TravelAppUpdateCarouselScrollPositionState extends TravelAppState {
  final int position;

  TravelAppUpdateCarouselScrollPositionState({required this.position});

  @override
  List<Object> get props => [position];
}
