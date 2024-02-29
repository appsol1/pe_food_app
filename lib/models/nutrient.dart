import 'package:json_annotation/json_annotation.dart';
part 'nutrient.g.dart';

@JsonSerializable()
class Nutrient {
  int? nutrientId;
  String? nutrientName;
  String? unitName;
  double? value;

  Nutrient();

  factory Nutrient.fromJson(Map<String, dynamic> json) => _$NutrientFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientToJson(this);
}
