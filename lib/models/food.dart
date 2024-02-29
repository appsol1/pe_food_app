import 'package:json_annotation/json_annotation.dart';
import 'package:pe_food_app/models/nutrient.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  String? description;
  String? foodCategory;
  List<Nutrient>? foodNutrients;

  Food();

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
