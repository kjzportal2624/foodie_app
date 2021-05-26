import 'package:dio/dio.dart';
import 'package:foodie_app/models/meal/meal.dart';
import 'package:foodie_app/models/meal_item/meal_item.dart';
import 'package:foodie_app/repositories/api_endpoints.dart';

class MealRepository {
  MealRepository._();

  /// Singleton - to ensure only one class instance is created
  static final MealRepository _instance = MealRepository._();
  factory MealRepository() => _instance;

  final ApiEndpoints _apiEndpoints = ApiEndpoints();

  static const _baseUrl = 'https://www.themealdb.com/';

  Future<Meal> getMeals(String category) async {
    final response = await Dio().get(_baseUrl + _apiEndpoints.endpoints['get_meals_by_category'] + category);
    return Meal.fromJson(response.data);
  }

  Future<MealItem> getMealItem(String mealId) async {
    final response = await Dio().get(_baseUrl + _apiEndpoints.endpoints['get_meals_by_id'] + mealId);
    return MealItem.fromJson(response.data);
  }
}
