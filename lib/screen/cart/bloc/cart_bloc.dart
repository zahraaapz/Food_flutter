import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../component/api_key.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {


      
     if (event is CartEventInit) {
       emit(CartLoading());
     await  Future.delayed(const Duration(milliseconds: 200)); emit(CartLoaded(cart));
     }
     if (event is CartEventAdd) {
      
     await  Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartAddItem(cart)));
     }
     if (event is CartEventRemove) {
      
     await  Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartRemoveItem(cart)));
     }
     if (event is CartEventDelete) {
      
    await   Future.delayed(const Duration(milliseconds: 200)).then((value) => emit(CartDeleteItem(cart)));
     }
    });
  }
}
