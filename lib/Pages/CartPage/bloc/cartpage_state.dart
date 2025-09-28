part of 'cartpage_bloc.dart';

@immutable
sealed class CartpageState {}

class CartpageInitial extends CartpageState {}

class CartSuccessState extends CartpageState {
  final List<Product> cartItems;
  CartSuccessState(this.cartItems);
}
