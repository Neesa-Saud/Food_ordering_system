part of 'description_bloc.dart';

@immutable
sealed class DescriptionEvent {}

class AddToCartButtonClickedEvent extends DescriptionEvent {
  final Product cartProduct;
  AddToCartButtonClickedEvent(this.cartProduct);
}

class OrderButtonClickedEvent extends DescriptionEvent {
  final Product orderProduct;

  OrderButtonClickedEvent(this.orderProduct);
}
class CartSuccessEvent extends DescriptionEvent{}
class OrderSuccessEvent extends DescriptionEvent{}

