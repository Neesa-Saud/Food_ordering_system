class Food {
  final int itemID;
  final String itemName;
  final String imageUrl;
  final String itemDescription;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  Food({
    required this.itemID,
    required this.itemName,
    required this.imageUrl,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
  });
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      itemID: json['itemID'] ?? 0,
      itemName: json['itemName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      itemDescription: json['itemDescription'] ?? '',
      itemPrice: (json['itemPrice'] ?? 0).toDouble(),
      restaurantName: json['restaurantName'] ?? '',
      restaurantID: json['restaurantID'] ?? 0,
    );
  }
}
