import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Data/CartOrder_model.dart';
import 'package:foodapp/Pages/OrdersPage/bloc/orderpage_bloc.dart';
import 'package:foodapp/Utils/Text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderpageBloc orderpageBloc = OrderpageBloc();
  @override
  void initState() {
    super.initState();
    orderpageBloc.add(OrderInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Your Orders", color: Colors.black, size: 20),
      ),
      body: BlocBuilder<OrderpageBloc, OrderpageState>(
        bloc: orderpageBloc,
        builder: (context, state) {
          List<Product> orderItems = [];
          if (state is OrderSuccessState) {
            orderItems = state.orderItems;
          }
          if (orderItems.isEmpty) {
            return const Center(child: Text("No any order placed"));
          }
          return ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final item = orderItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/foodlist.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(item.itemName),
                  subtitle: Text("Price: Rs. ${item.itemPrice}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        orderItems.removeAt(index);
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
