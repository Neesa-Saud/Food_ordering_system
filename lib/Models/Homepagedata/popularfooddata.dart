class Food {
  final int itemID;
  final String itemName;
  final String imageUrl;
  final String itemDescrption;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  Food({
    required this.itemID,
    required this.itemName,
    required this.imageUrl,
    required this.itemDescrption,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
  });
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      itemID: json['itemID'] ?? 0,
      itemName: json['itemName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      itemDescrption: json['itemDescrption'] ?? '',
      itemPrice: (json['itemPrice'] ?? 0).toDouble(),
      restaurantName: json['restaurantName'] ?? '',
      restaurantID: json['restaurantID'] ?? 0,
    );
  }
}
