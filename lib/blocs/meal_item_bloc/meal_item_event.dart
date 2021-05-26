part of 'meal_item_bloc.dart';

abstract class MealItemEvent extends Equatable {
  const MealItemEvent();

  @override
  List<Object> get props => [];
}

class FetchMealItem extends MealItemEvent {
  final String? mealId;
  FetchMealItem(this.mealId);
}
