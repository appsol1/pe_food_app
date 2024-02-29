import 'package:flutter/material.dart';
import 'package:pe_food_app/common/fonts.dart';
import 'package:pe_food_app/models/food.dart';

class FoodItem extends StatelessWidget {
  final Food data;
  const FoodItem({super.key, required this.data});

  String getEnergy(Food foodItem) {
    var nutrients = (foodItem.foodNutrients)?.where((element) => element.nutrientId == 1008).toList() ?? [];
    return nutrients.isEmpty ? '0' : '${nutrients.first.value ?? 0} ${(nutrients.first.unitName ?? '').toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(data.description ?? '', maxLines: 3, overflow: TextOverflow.ellipsis))),
            Text(
              getEnergy(data),
              style: Fonts.regular13,
            )
          ])),
    );
  }
}
