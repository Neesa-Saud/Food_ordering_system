part of 'description_bloc.dart';

@immutable
sealed class DescriptionEvent {}

class AddToCartButtonClickedEvent extends DescriptionEvent {}
class OrderButtonClickedEvent extends DescriptionEvent {}
