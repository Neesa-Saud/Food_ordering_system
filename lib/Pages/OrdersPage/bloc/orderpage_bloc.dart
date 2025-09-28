import 'package:bloc/bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:meta/meta.dart';

part 'orderpage_event.dart';
part 'orderpage_state.dart';

List<Product> orderItems = [];

class OrderpageBloc extends Bloc<OrderpageEvent, OrderpageState> {
  OrderpageBloc() : super(OrderpageInitial()) {
    on<OrderInitialEvent>((event, emit) {
      emit(OrderSuccessState(List<Product>.from(orderItems)));
    });

    on<AddOrderItemEvent>((event, emit) {
      orderItems.add(event.product);
      emit(OrderSuccessState(List<Product>.from(orderItems)));
    });
  }
}
