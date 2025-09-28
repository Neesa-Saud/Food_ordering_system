part of 'orderpage_bloc.dart';

@immutable
sealed class OrderpageState {}

class OrderpageInitial extends OrderpageState {}

class OrderSuccessState extends OrderpageState {
  final List<Product> cartItems;
  OrderSuccessState(this.cartItems);
}
