import 'package:bloc/bloc.dart';
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
  emit(ItemAddedToCartState());
}

Future<void> orderButtonClickedEventHandler(
  OrderButtonClickedEvent event,
  Emitter<DescriptionState> emit,
) async {
  emit(OrderPlacedState());
}
