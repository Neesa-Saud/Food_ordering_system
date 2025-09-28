part of 'orderpage_bloc.dart';

@immutable
sealed class OrderpageEvent {}

class OrderInitialEvent extends OrderpageEvent {}

class AddOrderItemEvent extends OrderpageEvent {
  final Product product;
  AddOrderItemEvent(this.product);
}
