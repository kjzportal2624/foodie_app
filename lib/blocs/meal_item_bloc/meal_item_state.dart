part of 'meal_item_bloc.dart';

abstract class MealItemState extends Equatable {
  const MealItemState();

  @override
  List<Object> get props => [];
}

class MealItemInitial extends MealItemState {}

class MealItemLoading extends MealItemState {}

class MealItemFetched extends MealItemState {
  final Item item;
  MealItemFetched(this.item);

  @override
  List<Object> get props => [item];
}

class MealItemEmptyList extends MealItemState {
  final String message;
  MealItemEmptyList(this.message);

  @override
  List<Object> get props => [message];
}

class MealItemFetchError extends MealItemState {
  final String errorMessage;
  MealItemFetchError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
