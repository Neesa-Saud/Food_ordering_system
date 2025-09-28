import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orderpage_event.dart';
part 'orderpage_state.dart';

class OrderpageBloc extends Bloc<OrderpageEvent, OrderpageState> {
  OrderpageBloc() : super(OrderpageInitial()) {
    on<OrderpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
