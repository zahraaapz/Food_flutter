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
    on<HomeEvent>((event, emit) async {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final home = iHomeRepo.getHome();
          List list = await iHomeRepo.allProduct();
          emit(HomeLoaded(list,home: home));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }
}
