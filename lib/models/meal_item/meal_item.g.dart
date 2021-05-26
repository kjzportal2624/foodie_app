// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealItem _$MealItemFromJson(Map<String, dynamic> json) {
  return MealItem(
    (json['meals'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealItemToJson(MealItem instance) => <String, dynamic>{
      'meals': instance.meals,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['idMeal'] as String,
    json['strMeal'] as String,
    json['strDrinkAlternate'],
    json['strCategory'],
    json['strArea'],
    json['strInstructions'],
    json['strMealThumb'],
    json['strTags'],
    json['strYoutube'],
    json['strIngredient1'],
    json['strIngredient2'],
    json['strIngredient3'],
    json['strIngredient4'],
    json['strIngredient5'],
    json['strIngredient6'],
    json['strIngredient7'],
    json['strIngredient8'],
    json['strIngredient9'],
    json['strIngredient10'],
    json['strIngredient11'],
    json['strIngredient12'],
    json['strIngredient13'],
    json['strIngredient14'],
    json['strIngredient15'],
    json['strIngredient16'],
    json['strIngredient17'],
    json['strIngredient18'],
    json['strIngredient19'],
    json['strIngredient20'],
    json['strMeasure1'],
    json['strMeasure2'],
    json['strMeasure3'],
    json['strMeasure4'],
    json['strMeasure5'],
    json['strMeasure6'],
    json['strMeasure7'],
    json['strMeasure8'],
    json['strMeasure9'],
    json['strMeasure10'],
    json['strMeasure11'],
    json['strMeasure12'],
    json['strMeasure13'],
    json['strMeasure14'],
    json['strMeasure15'],
    json['strMeasure16'],
    json['strMeasure17'],
    json['strMeasure18'],
    json['strMeasure19'],
    json['strMeasure20'],
    json['strSource'],
    json['strImageSource'],
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'idMeal': instance.mealId,
      'strMeal': instance.mealTitle,
      'strDrinkAlternate': instance.drinkAlternate,
      'strCategory': instance.mealCategory,
      'strArea': instance.mealArea,
      'strInstructions': instance.mealInstructions,
      'strMealThumb': instance.mealImageUrl,
      'strTags': instance.mealTags,
      'strYoutube': instance.mealYoutubeLink,
      'strIngredient1': instance.mealIngredient1,
      'strIngredient2': instance.mealIngredient2,
      'strIngredient3': instance.mealIngredient3,
      'strIngredient4': instance.mealIngredient4,
      'strIngredient5': instance.mealIngredient5,
      'strIngredient6': instance.mealIngredient6,
      'strIngredient7': instance.mealIngredient7,
      'strIngredient8': instance.mealIngredient8,
      'strIngredient9': instance.mealIngredient9,
      'strIngredient10': instance.mealIngredient10,
      'strIngredient11': instance.mealIngredient11,
      'strIngredient12': instance.mealIngredient12,
      'strIngredient13': instance.mealIngredient13,
      'strIngredient14': instance.mealIngredient14,
      'strIngredient15': instance.mealIngredient15,
      'strIngredient16': instance.mealIngredient16,
      'strIngredient17': instance.mealIngredient17,
      'strIngredient18': instance.mealIngredient18,
      'strIngredient19': instance.mealIngredient19,
      'strIngredient20': instance.mealIngredient20,
      'strMeasure1': instance.mealMeasure1,
      'strMeasure2': instance.mealMeasure2,
      'strMeasure3': instance.mealMeasure3,
      'strMeasure4': instance.mealMeasure4,
      'strMeasure5': instance.mealMeasure5,
      'strMeasure6': instance.mealMeasure6,
      'strMeasure7': instance.mealMeasure7,
      'strMeasure8': instance.mealMeasure8,
      'strMeasure9': instance.mealMeasure9,
      'strMeasure10': instance.mealMeasure10,
      'strMeasure11': instance.mealMeasure11,
      'strMeasure12': instance.mealMeasure12,
      'strMeasure13': instance.mealMeasure13,
      'strMeasure14': instance.mealMeasure14,
      'strMeasure15': instance.mealMeasure15,
      'strMeasure16': instance.mealMeasure16,
      'strMeasure17': instance.mealMeasure17,
      'strMeasure18': instance.mealMeasure18,
      'strMeasure19': instance.mealMeasure19,
      'strMeasure20': instance.mealMeasure20,
      'strSource': instance.mealSource,
      'strImageSource': instance.mealImageSource,
    };
