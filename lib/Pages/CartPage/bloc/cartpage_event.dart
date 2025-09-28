part of 'cartpage_bloc.dart';

@immutable
sealed class CartpageEvent {}

class cartInitialEvent extends CartpageEvent {}

class AddItemEvent extends CartpageEvent {
  final Product product;
  AddItemEvent(this.product);
}
