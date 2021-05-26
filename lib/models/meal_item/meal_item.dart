import 'package:json_annotation/json_annotation.dart';
part 'meal_item.g.dart';

@JsonSerializable()
class MealItem {
  final List<Item> meals;

  MealItem(this.meals);

  factory MealItem.fromJson(Map<String, dynamic> json) => _$MealItemFromJson(json);

  Map<String, dynamic> toJson() => _$MealItemToJson(this);

  Item? get item => meals.first;
}

@JsonSerializable()
class Item {
  @JsonKey(name: 'idMeal')
  final String mealId;

  @JsonKey(name: 'strMeal')
  final String mealTitle;

  @JsonKey(name: 'strDrinkAlternate')
  final dynamic drinkAlternate;

  @JsonKey(name: 'strCategory')
  final dynamic mealCategory;

  @JsonKey(name: 'strArea')
  final dynamic mealArea;

  @JsonKey(name: 'strInstructions')
  final dynamic mealInstructions;

  @JsonKey(name: 'strMealThumb')
  final dynamic mealImageUrl;

  @JsonKey(name: 'strTags')
  final dynamic mealTags;

  @JsonKey(name: 'strYoutube')
  final dynamic mealYoutubeLink;

  @JsonKey(name: 'strIngredient1')
  final dynamic mealIngredient1;

  @JsonKey(name: 'strIngredient2')
  final dynamic mealIngredient2;

  @JsonKey(name: 'strIngredient3')
  final dynamic mealIngredient3;

  @JsonKey(name: 'strIngredient4')
  final dynamic mealIngredient4;

  @JsonKey(name: 'strIngredient5')
  final dynamic mealIngredient5;

  @JsonKey(name: 'strIngredient6')
  final dynamic mealIngredient6;

  @JsonKey(name: 'strIngredient7')
  final dynamic mealIngredient7;

  @JsonKey(name: 'strIngredient8')
  final dynamic mealIngredient8;

  @JsonKey(name: 'strIngredient9')
  final dynamic mealIngredient9;

  @JsonKey(name: 'strIngredient10')
  final dynamic mealIngredient10;

  @JsonKey(name: 'strIngredient11')
  final dynamic mealIngredient11;

  @JsonKey(name: 'strIngredient12')
  final dynamic mealIngredient12;

  @JsonKey(name: 'strIngredient13')
  final dynamic mealIngredient13;

  @JsonKey(name: 'strIngredient14')
  final dynamic mealIngredient14;

  @JsonKey(name: 'strIngredient15')
  final dynamic mealIngredient15;

  @JsonKey(name: 'strIngredient16')
  final dynamic mealIngredient16;

  @JsonKey(name: 'strIngredient17')
  final dynamic mealIngredient17;

  @JsonKey(name: 'strIngredient18')
  final dynamic mealIngredient18;

  @JsonKey(name: 'strIngredient19')
  final dynamic mealIngredient19;

  @JsonKey(name: 'strIngredient20')
  final dynamic mealIngredient20;

  @JsonKey(name: 'strMeasure1')
  final dynamic mealMeasure1;

  @JsonKey(name: 'strMeasure2')
  final dynamic mealMeasure2;

  @JsonKey(name: 'strMeasure3')
  final dynamic mealMeasure3;

  @JsonKey(name: 'strMeasure4')
  final dynamic mealMeasure4;

  @JsonKey(name: 'strMeasure5')
  final dynamic mealMeasure5;

  @JsonKey(name: 'strMeasure6')
  final dynamic mealMeasure6;

  @JsonKey(name: 'strMeasure7')
  final dynamic mealMeasure7;

  @JsonKey(name: 'strMeasure8')
  final dynamic mealMeasure8;

  @JsonKey(name: 'strMeasure9')
  final dynamic mealMeasure9;

  @JsonKey(name: 'strMeasure10')
  final dynamic mealMeasure10;

  @JsonKey(name: 'strMeasure11')
  final dynamic mealMeasure11;

  @JsonKey(name: 'strMeasure12')
  final dynamic mealMeasure12;

  @JsonKey(name: 'strMeasure13')
  final dynamic mealMeasure13;

  @JsonKey(name: 'strMeasure14')
  final dynamic mealMeasure14;

  @JsonKey(name: 'strMeasure15')
  final dynamic mealMeasure15;

  @JsonKey(name: 'strMeasure16')
  final dynamic mealMeasure16;

  @JsonKey(name: 'strMeasure17')
  final dynamic mealMeasure17;

  @JsonKey(name: 'strMeasure18')
  final dynamic mealMeasure18;

  @JsonKey(name: 'strMeasure19')
  final dynamic mealMeasure19;

  @JsonKey(name: 'strMeasure20')
  final dynamic mealMeasure20;

  @JsonKey(name: 'strSource')
  final dynamic mealSource;

  @JsonKey(name: 'strImageSource')
  final dynamic mealImageSource;

  Item(
    this.mealId,
    this.mealTitle,
    this.drinkAlternate,
    this.mealCategory,
    this.mealArea,
    this.mealInstructions,
    this.mealImageUrl,
    this.mealTags,
    this.mealYoutubeLink,
    this.mealIngredient1,
    this.mealIngredient2,
    this.mealIngredient3,
    this.mealIngredient4,
    this.mealIngredient5,
    this.mealIngredient6,
    this.mealIngredient7,
    this.mealIngredient8,
    this.mealIngredient9,
    this.mealIngredient10,
    this.mealIngredient11,
    this.mealIngredient12,
    this.mealIngredient13,
    this.mealIngredient14,
    this.mealIngredient15,
    this.mealIngredient16,
    this.mealIngredient17,
    this.mealIngredient18,
    this.mealIngredient19,
    this.mealIngredient20,
    this.mealMeasure1,
    this.mealMeasure2,
    this.mealMeasure3,
    this.mealMeasure4,
    this.mealMeasure5,
    this.mealMeasure6,
    this.mealMeasure7,
    this.mealMeasure8,
    this.mealMeasure9,
    this.mealMeasure10,
    this.mealMeasure11,
    this.mealMeasure12,
    this.mealMeasure13,
    this.mealMeasure14,
    this.mealMeasure15,
    this.mealMeasure16,
    this.mealMeasure17,
    this.mealMeasure18,
    this.mealMeasure19,
    this.mealMeasure20,
    this.mealSource,
    this.mealImageSource,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  List<String>? get tags => (mealTags != null) ? mealTags.split(',') : null;
}
