// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    (json['meals'] as List<dynamic>)
        .map((e) => MealData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'meals': instance.meals,
    };

MealData _$MealDataFromJson(Map<String, dynamic> json) {
  return MealData(
    json['idMeal'] as String,
    json['strMeal'] as String,
    json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$MealDataToJson(MealData instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.mealTitle,
      'strMealThumb': instance.mealThumbUrl,
    };
