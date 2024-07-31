import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../component/api_key.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {

final cart=myCartBox.values.toList();
      
     if (event is CartEventInit) {
       emit(CartLoading());
     await  Future.delayed(const Duration(milliseconds: 200)); emit(CartLoaded());
    cartCount.value=cart.length;
    
     }
     if (event is CartEventAdd) {
      
     await  Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartAddItem()));
 }
     if (event is CartEventRemove) {
      
     await  Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartRemoveItem()));
 }
     if (event is CartEventDelete) {
      
    await   Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartDeleteItem()));
     cartCount.value=cart.length;
    }
    });
  }
}
