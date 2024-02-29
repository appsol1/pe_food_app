import 'package:flutter/material.dart';
import 'package:pe_food_app/common/fonts.dart';
import 'package:pe_food_app/models/food.dart';
import 'package:pe_food_app/screens/home/widgets/food_item.dart';

class FoodCategorySection extends StatelessWidget {
  final String categoryName;
  final List<Food> categoryItems;
  const FoodCategorySection({super.key, this.categoryName = '', this.categoryItems = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(categoryName, style: Fonts.sb16),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: categoryItems.map((e) => FoodItem(data: e)).toList(),
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}
