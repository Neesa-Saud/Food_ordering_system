part of 'start_page_bloc.dart';

@immutable
sealed class StartPageState {}

final class StartPageActionState extends StartPageState {}

final class StartPageInitial extends StartPageState {}

final class StartPageButtonClickedState extends StartPageActionState {}
