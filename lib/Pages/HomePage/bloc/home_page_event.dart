part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class FetchFoodEvent extends HomePageEvent {}

class FoodSelectedEvent extends HomePageEvent {}
class CartClickedEvent extends HomePageEvent {}
class OrdersClickedEvent extends HomePageEvent {}
