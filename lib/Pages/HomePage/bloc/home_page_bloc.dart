import 'package:bloc/bloc.dart';
import 'package:foodapp/Models/Homepagedata/fetchingfood.dart';
import 'package:foodapp/Models/Homepagedata/popularfooddata.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<FetchFoodEvent>(fetchFoodEventhandler);
    on<FoodSelectedEvent>(foodSelectedEventhandler);
  }
}

Future<void> fetchFoodEventhandler(
  FetchFoodEvent event,
  Emitter<HomePageState> emit,
) async {
  emit(FoodLoadingState());
  try {
    // Use proper variable name (lowercase)
    final foods = await ApiService().fetchFoodItems();

    if (foods.isEmpty) {
      emit(FoodErrorState("No food items found"));
    } else {
      emit(FoodLoadedState(foods));
    }
  } catch (e) {
    // Print error for debugging
    print("Error fetching foods: $e");
    emit(FoodErrorState("Failed to fetch foods. Error: $e"));
  }
}

Future<void> foodSelectedEventhandler(
  FoodSelectedEvent event,
  Emitter<HomePageState> emit,
) async {
  emit(FoodSelectedState());
}
