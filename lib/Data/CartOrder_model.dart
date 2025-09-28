class Product {
  final String itemName;
  final String imageUrl;

  final double itemPrice;
  final String restaurantName;

  Product({
    required this.itemName,
    required this.imageUrl,

    required this.itemPrice,
    required this.restaurantName,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      itemName: json['itemName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',

      itemPrice: (json['itemPrice'] ?? 0).toDouble(),
      restaurantName: json['restaurantName'] ?? '',
    );
  }
}
