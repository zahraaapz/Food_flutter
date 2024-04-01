part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


final class CartEventInit extends CartEvent{}
final class CartEventDelete extends CartEvent{}

final class CartEventAdd extends CartEvent{}
final class CartEventRemove extends CartEvent{}