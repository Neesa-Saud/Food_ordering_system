import 'package:flutter/material.dart';
import 'package:foodapp/Models/Homepagedata/horizontalscroll.dart';
import 'package:foodapp/Utils/Text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(0),
                          topEnd: Radius.circular(0),
                          bottomStart: Radius.circular(10),
                          bottomEnd: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://cdn.grabon.in/gograbon/images/web-images/uploads/1618575517942/food-coupons.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      // ignore: sort_child_properties_last
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: Icon(Icons.list, color: Colors.white),
                      ),
                      top: 8,
                      left: 8,
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 8,
                      child: Container(
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "Search....",
                            hintStyle: TextStyle(fontSize: 16),
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 60, // height of image + name
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodItems.length, // e.g., 10 items
                    itemBuilder: (context, index) {
                      final food = foodItems[index];
                      return Container(
                        width: 40, // equal width for all containers
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Food image container
                            Container(
                              height: 40,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(food.image),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            // Food name
                            Text(
                              food.name,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ModifiedText(
                    text: "Popular Restaurants",
                    color: Colors.black,
                    size: 17,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(itemBuilder: itemBuilder, scrollDirection: Axis.horizontal),
                )
              ],
            ),
          ),
          BottomNavigationBar(
            fixedColor: Colors.amber,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'Cart',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
