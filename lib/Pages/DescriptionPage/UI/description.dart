import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:foodapp/Pages/CartPage/bloc/cartpage_bloc.dart';
import 'package:foodapp/Pages/OrdersPage/bloc/orderpage_bloc.dart';
import 'package:foodapp/Utils/Text.dart';

class DescriptionPage extends StatelessWidget {
  final String itemName, itemDescription, itemImage, restaurantName;
  final double itemPrice;

  const DescriptionPage({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.itemImage,
    required this.itemPrice,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartpageBloc>(context);
    final orderBloc = BlocProvider.of<OrderpageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Details", color: Colors.black, size: 17),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: itemImage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/foodlist.png"),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          ModifiedText(text: itemName, color: Colors.black, size: 20),
          SizedBox(height: 8),
          ModifiedText(
            text: "By $restaurantName",
            color: Colors.grey,
            size: 14,
          ),
          ModifiedText(
            text: "Price: Rs. $itemPrice",
            color: Colors.black,
            size: 14,
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ModifiedText(
              text: itemDescription,
              color: Colors.grey,
              size: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: () {
                  final product = Product(
                    itemName: itemName,
                    imageUrl: itemImage,
                    itemPrice: itemPrice,
                    restaurantName: restaurantName,
                  );
                  cartBloc.add(AddItemEvent(product));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added to cart")),
                  );
                },
                child: ModifiedText(
                  text: "Add to cart",
                  color: Colors.black,
                  size: 12,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: () {
                  final product = Product(
                    itemName: itemName,
                    imageUrl: itemImage,
                    itemPrice: itemPrice,
                    restaurantName: restaurantName,
                  );
                  orderBloc.add(AddOrderItemEvent(product));

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Item Ordered")));
                },
                child: ModifiedText(
                  text: "Order",
                  color: Colors.black,
                  size: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
