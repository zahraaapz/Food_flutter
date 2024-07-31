part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  CartLoaded();
}

final class CartLoadError extends CartState {}

final class CartAddItem extends CartState {
  CartAddItem();
}

final class CartDeleteItem extends CartState {
  CartDeleteItem();
}

final class CartRemoveItem extends CartState {
  CartRemoveItem();
}
