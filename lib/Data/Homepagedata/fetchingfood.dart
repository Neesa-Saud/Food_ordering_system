import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'popularfooddata.dart';

class ApiService {
  final String apiUrl =
      "https://fakerestaurantapi.runasp.net/api/Restaurant/items";

  Future<List<Food>> fetchFoodItems() async {
    try {
      // Try fetching API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Food.fromJson(e)).toList();
      } else {
        throw Exception("API returned status ${response.statusCode}");
      }
    } catch (e) {
      print("API fetch failed, using local JSON. Error: $e");

      // Load from local JSON
      final String localData = await rootBundle.loadString('assets/foods.json');
      final List data = json.decode(localData);
      return data.map((e) => Food.fromJson(e)).toList();
    }
  }
}
