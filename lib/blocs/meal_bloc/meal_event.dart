part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class FetchMeals extends MealEvent {
  final String? searchKey;
  FetchMeals(this.searchKey);
}
