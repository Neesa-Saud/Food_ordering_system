import 'package:bloc/bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:foodapp/Data/CartPage/cartItems.dart';
import 'package:foodapp/Data/OrderPageData/orderpagedata.dart';

import 'package:meta/meta.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionInitial()) {
    on<AddToCartButtonClickedEvent>(addToCartButtonClickedEventHandler);
    on<OrderButtonClickedEvent>(orderButtonClickedEventHandler);
  }
}

Future<void> addToCartButtonClickedEventHandler(
  AddToCartButtonClickedEvent event,
  Emitter<DescriptionState> emit,
) async {
  cartItems.add(event.cartProduct);
  emit(ItemAddedToCartState());
}

Future<void> orderButtonClickedEventHandler(
  OrderButtonClickedEvent event,
  Emitter<DescriptionState> emit,
) async {
  orderItems.add(event.orderProduct);
  emit(OrderPlacedState());
}
