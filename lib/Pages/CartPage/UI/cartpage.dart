import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:foodapp/Data/CartPage/cartItems.dart';
import 'package:foodapp/Pages/CartPage/bloc/cartpage_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartpageBloc cartpageBloc = CartpageBloc();

  @override
  void initState() {
    super.initState();
    cartpageBloc.add(cartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Items")),
      body: BlocBuilder<CartpageBloc, CartpageState>(
        bloc: cartpageBloc,

        builder: (context, state) {
          List<Product> cartItems = [];

          if (state is CartSuccessState) {
            cartItems = state.cartItems;
          }

          if (cartItems.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(item.imageUrl, fit: BoxFit.cover),
                  ),
                  title: Text(item.itemName),
                  subtitle: Text("Price: Rs. ${item.itemPrice}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
