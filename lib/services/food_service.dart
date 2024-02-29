import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pe_food_app/common/constants.dart';
import 'package:pe_food_app/models/food.dart';

class FoodService {
  Future<Map<String, List<Food>>> search(String query) async {
    var url = Uri.parse(
        'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=${Constants.foodApiKey}&dataType=Branded&query=${Uri.encodeComponent(query)}');
    try {
      var response = await http.get(url);
      var foodItems = jsonDecode(response.body)['foods'];

      // Serialize and group food items based on category
      Map<String, List<Food>> grouped = {};
      for (var i = 0; i < foodItems.length; i++) {
        final foodItem = Food.fromJson(foodItems[i]);
        final catName = foodItem.foodCategory;
        if (catName == null || catName.isEmpty) continue;
        if (grouped.containsKey(catName)) {
          (grouped[catName] as List).add(foodItem);
        } else {
          grouped[catName] = [foodItem];
        }
      }
      return grouped;
    } catch (e) {
      rethrow;
    }
  }
}
