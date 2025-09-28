import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Sample data for now
  final List<Map<String, String>> cartItems = [
    {
      "name": "Afghan Kebabs",
      "price": "450",
      "image":
          "https://fakerestaurantapi.runasp.net/images/afghan%20kebabs.jpg"
    },
    {
      "name": "Butter Chicken",
      "price": "500",
      "image":
          "https://fakerestaurantapi.runasp.net/images/butter%20chicken.jpg"
    },
    {
      "name": "Dal Makhani",
      "price": "300",
      "image":
          "https://fakerestaurantapi.runasp.net/images/Dal-Makhani.webp"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item['name']!),
              subtitle: Text("Price: Rs. ${item['price']}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
