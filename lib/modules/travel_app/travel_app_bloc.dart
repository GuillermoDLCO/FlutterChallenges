import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/travel_app/country.dart';

class TravelAppBloc extends Cubit<TravelAppState> {
  TravelAppBloc() : super(TravelAppBlocInitialState()) {
    countries = countriesData;
    selectedCountry = countries.first;
  }
  late List<Country> countries;
  late Country selectedCountry;
  bool enableChangeTopScrollPosition = true;

  void changeCountry(Country country, {bool isCarousel = false}) {
    if (enableChangeTopScrollPosition) {
      enableChangeTopScrollPosition = false;
      selectedCountry = country;
      final indexCountry = countries
          .indexWhere((element) => element.name == selectedCountry.name);
      if (isCarousel) {
        emit(TravelAppUpdateTopScrollPositionState(position: indexCountry));
      } else {
        emit(
          TravelAppUpdateCarouselScrollPositionState(position: indexCountry),
        );
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
  const TravelAppChangeCountryState({required this.selectedCountry});
  final Country selectedCountry;

  @override
  List<Object> get props => [selectedCountry];
}

class TravelAppUpdateTopScrollPositionState extends TravelAppState {
  const TravelAppUpdateTopScrollPositionState({required this.position});
  final int position;

  @override
  List<Object> get props => [position];
}

class TravelAppUpdateCarouselScrollPositionState extends TravelAppState {
  const TravelAppUpdateCarouselScrollPositionState({required this.position});
  final int position;

  @override
  List<Object> get props => [position];
}
