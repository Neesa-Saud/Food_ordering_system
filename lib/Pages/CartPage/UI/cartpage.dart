import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample cart items
  final List<Map<String, String>> cartItems = [
    {
      "name": "Afghan Kebabs",
      "price": "450",
      "image":
          "https://fakerestaurantapi.runasp.net/images/afghan%20kebabs.jpg",
    },
    {
      "name": "Butter Chicken",
      "price": "500",
      "image":
          "https://fakerestaurantapi.runasp.net/images/butter%20chicken.jpg",
    },
    {
      "name": "Dal Makhani",
      "price": "300",
      "image": "https://fakerestaurantapi.runasp.net/images/Dal-Makhani.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: Rs. ${cartItems.fold<int>(0, (sum, item) => sum + int.parse(item['price']!))}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to OrderPage or handle checkout
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
