import 'package:json_annotation/json_annotation.dart';
part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final List<MealData> meals;

  Meal(this.meals);

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}

@JsonSerializable()
class MealData {
  @JsonKey(name: 'idMeal')
  final String id;

  @JsonKey(name: 'strMeal')
  final String mealTitle;

  @JsonKey(name: 'strMealThumb')
  final String mealThumbUrl;

  MealData(this.id, this.mealTitle, this.mealThumbUrl);

  factory MealData.fromJson(Map<String, dynamic> json) => _$MealDataFromJson(json);

  Map<String, dynamic> toJson() => _$MealDataToJson(this);
}
