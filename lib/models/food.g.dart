// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food()
  ..description = json['description'] as String?
  ..foodCategory = json['foodCategory'] as String?
  ..foodNutrients = (json['foodNutrients'] as List<dynamic>?)
      ?.map((e) => Nutrient.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'description': instance.description,
      'foodCategory': instance.foodCategory,
      'foodNutrients': instance.foodNutrients,
    };
