import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeapp/HomeScreen/data/models/products.dart';

class ApiService {
  static Future<List<Recipes>> fetchRecipes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final products = Products.fromJson(jsonMap);
      return products.recipes ?? [];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
