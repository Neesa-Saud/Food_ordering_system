import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Pages/DescriptionPage/UI/description.dart';
import 'package:foodapp/Pages/HomePage/bloc/home_page_bloc.dart';

class Popularfood extends StatefulWidget {
  const Popularfood({super.key});

  @override
  State<Popularfood> createState() => _PopularfoodState();
}

class _PopularfoodState extends State<Popularfood> {
  final HomePageBloc homePageBloc = HomePageBloc();
  @override
  void initState() {
    homePageBloc.add(FetchFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listenWhen: (previous, current) => current is! HomePageState,
      buildWhen: (previous, current) => current is HomePageState,
      builder: (context, state) {
        if (state is FoodLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FoodErrorState) {
          return Center(child: Text("Error : ${state.message}"));
        } else if (state is FoodLoadedState) {
          final foods = state.foods;
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                            itemName: food.itemName,
                            itemDescription: food.itemDescription,
                            itemImage: food.imageUrl,
                            itemPrice: food.itemPrice,
                            restaurantName: food.restaurantName,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            food.imageUrl,
                            height: 50,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/foodlist.png',
                                height: 50,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            food.itemName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Rs. ${food.itemPrice}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            food.restaurantName,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        // Default widget if no state matches
        return const SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }
}
