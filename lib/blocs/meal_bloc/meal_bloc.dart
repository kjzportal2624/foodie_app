import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie_app/models/meal/meal.dart';
import 'package:foodie_app/repositories/meal_repository.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepository mealRepository;
  MealBloc(this.mealRepository) : super(MealInitial());

  @override
  Stream<MealState> mapEventToState(
    MealEvent event,
  ) async* {
    if (event is FetchMeals) {
      yield* _mapFetchMealByCategoryToState(event);
    }
  }

  Stream<MealState> _mapFetchMealByCategoryToState(
    FetchMeals event,
  ) async* {
    yield MealLoading();
    try {
      final Meal meal = await mealRepository.getMeals(event.searchKey!);
      yield MealFetched(meal.meals);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        yield MealFetchError('Something went wrong.[${e.response!.statusCode}]');
      } else if (e.type == DioErrorType.other || e.type == DioErrorType.connectTimeout) {
        yield MealFetchError('Please check your internet connection.');

        if (e.type == DioErrorType.connectTimeout) {
          final CancelToken token = CancelToken();
          token.cancel("cancelled");
        }
      } else {
        yield MealFetchError('Something went wrong.');
      }
    } catch (err) {
      print(err.toString());
      yield MealFetchError(err.toString());
    }
  }
}
