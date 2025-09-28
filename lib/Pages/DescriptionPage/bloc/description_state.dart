part of 'description_bloc.dart';

@immutable
sealed class DescriptionState {}

final class DescriptionInitial extends DescriptionState {}
final class ItemAddedToCartState extends DescriptionState {}
final class OrderPlacedState extends DescriptionState {}
