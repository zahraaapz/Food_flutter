part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}
final class HomeLoaded extends HomeState {
 final Home home;
 final List list;
  HomeLoaded(this.list, {required this.home});
}
final class HomeError extends HomeState {}
