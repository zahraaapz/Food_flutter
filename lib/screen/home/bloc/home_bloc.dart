import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/data/model/home.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/main.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          emit(HomeLoaded(home: iHomeRepo.getHome()));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }
}
