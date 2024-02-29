import 'package:get/state_manager.dart';
import 'package:pe_food_app/models/food.dart';
import 'package:pe_food_app/services/food_service.dart';

class HomeState extends GetxController {
  var isLoading = false.obs;
  var results = RxMap<String, List<Food>>();

  onSearch(String query) async {
    if (query.isEmpty || query.length < 3) return;

    isLoading.value = true;
    try {
      results.value = await FoodService().search(query);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
