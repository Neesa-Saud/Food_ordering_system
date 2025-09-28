import 'package:bloc/bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:meta/meta.dart';

part 'cartpage_event.dart';
part 'cartpage_state.dart';

List<Product> cartItems = []; // Global cart list

class CartpageBloc extends Bloc<CartpageEvent, CartpageState> {
  CartpageBloc() : super(CartpageInitial()) {
    on<cartInitialEvent>((event, emit) {
      emit(CartSuccessState(List<Product>.from(cartItems)));
    });

    on<AddItemEvent>((event, emit) {
      cartItems.add(event.product);
      emit(CartSuccessState(List<Product>.from(cartItems)));
    });
  }
}
