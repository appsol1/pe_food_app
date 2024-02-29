// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutrient _$NutrientFromJson(Map<String, dynamic> json) => Nutrient()
  ..nutrientId = json['nutrientId'] as int?
  ..nutrientName = json['nutrientName'] as String?
  ..unitName = json['unitName'] as String?
  ..value = (json['value'] as num?)?.toDouble();

Map<String, dynamic> _$NutrientToJson(Nutrient instance) => <String, dynamic>{
      'nutrientId': instance.nutrientId,
      'nutrientName': instance.nutrientName,
      'unitName': instance.unitName,
      'value': instance.value,
    };
