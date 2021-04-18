import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum IndexPage {
  home,
  video,
  market,
  profile,
  options,
}

class BottomNavigationBloc extends Cubit<BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState(IndexPage.home));

  void changePage(IndexPage page) {
    emit(BottomNavigationState(page));
  }
}

class BottomNavigationState extends Equatable {
  final IndexPage page;

  const BottomNavigationState(this.page);

  @override
  List<Object> get props => [page];
}
