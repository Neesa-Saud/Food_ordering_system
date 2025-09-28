import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Utils/Text.dart';

class DescriptionPage extends StatefulWidget {
  final String itemName, itemDescription, itemImage, itemPrice, restaurantName;

  const DescriptionPage({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.itemImage,
    required this.itemPrice,
    required this.restaurantName,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Details", color: Colors.black, size: 17),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.itemImage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/foodlist.png"),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 30,
            child: ModifiedText(
              text: widget.itemName,
              color: Colors.black,
              size: 20,
            ),
          ),
          SizedBox(height: 3),
          Container(
            width: double.infinity,
            height: 20,
            child: ModifiedText(
              text: "By ${widget.restaurantName}",
              color: Colors.grey,
              size: 14,
            ),
          ),
          SizedBox(height: 2),
          Container(
            width: double.infinity,
            height: 20,
            child: ModifiedText(
              text: "Price: Rs. ${widget.itemPrice}",
              color: Colors.black,
              size: 14,
            ),
          ),
          SizedBox(height: 3),
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: ModifiedText(
              text: widget.itemDescription,
              color: Colors.grey,
              size: 14,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.amberAccent,
                  ),
                ),
                onPressed: () {},
                child: ModifiedText(
                  text: "Add to cart",
                  color: Colors.black,
                  size: 10,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.amberAccent,
                  ),
                ),
                onPressed: () {},
                child: ModifiedText(
                  text: "Order",
                  color: Colors.black,
                  size: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
