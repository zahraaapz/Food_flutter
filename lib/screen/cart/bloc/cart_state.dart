part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {
  final List cart;

  CartLoaded(this.cart);

}


final class CartLoadError extends CartState {}
final class CartAddItem extends CartState {
    final List cart;

  CartAddItem(this.cart);
}
final class CartDeleteItem extends CartState {
    final List cart;

  CartDeleteItem(this.cart);
}
final class CartRemoveItem extends CartState {
  final List cart;

  CartRemoveItem(this.cart);
}

