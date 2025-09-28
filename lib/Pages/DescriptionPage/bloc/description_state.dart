part of 'description_bloc.dart';

@immutable
sealed class DescriptionState {}

final class DescriptionActionState extends DescriptionState {}

final class DescriptionInitial extends DescriptionState {}

final class ItemAddedToCartState extends DescriptionActionState {}

final class OrderPlacedState extends DescriptionActionState {}
