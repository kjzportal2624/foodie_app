part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealFetched extends MealState {
  final List<MealData> mealResult;
  MealFetched(this.mealResult);

  @override
  List<Object> get props => [mealResult];
}

class MealEmptyList extends MealState {
  final String message;
  MealEmptyList(this.message);

  @override
  List<Object> get props => [message];
}

class MealFetchError extends MealState {
  final String errorMessage;
  MealFetchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
