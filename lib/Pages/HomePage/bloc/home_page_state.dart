part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

class HomepageActionState extends HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class FoodLoadingState extends HomePageState {}

final class FoodLoadedState extends HomePageState {
  final List<Food> foods;
  FoodLoadedState(this.foods);
}

final class HomePageError extends HomePageState {
  final String message;
  HomePageError(this.message);
}

final class FoodErrorState extends HomePageState {
  final String message;
  FoodErrorState(this.message);
}

final class FoodSelectedState extends HomePageState {}

final class CartClickedState extends HomePageState {}

final class OrdersClickedState extends HomePageState {}
