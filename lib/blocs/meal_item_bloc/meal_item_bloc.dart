import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie_app/models/meal_item/meal_item.dart';
import 'package:foodie_app/repositories/meal_repository.dart';

part 'meal_item_event.dart';
part 'meal_item_state.dart';

class MealItemBloc extends Bloc<MealItemEvent, MealItemState> {
  final MealRepository mealRepository;
  MealItemBloc(this.mealRepository) : super(MealItemInitial());

  @override
  Stream<MealItemState> mapEventToState(
    MealItemEvent event,
  ) async* {
    if (event is FetchMealItem) {
      yield* _mapFetchMealItemByIdToState(event);
    }
  }

  Stream<MealItemState> _mapFetchMealItemByIdToState(FetchMealItem event) async* {
    yield MealItemLoading();
    try {
      final MealItem mealItem = await mealRepository.getMealItem(event.mealId!);

      print(mealItem.item);

      yield MealItemFetched(mealItem.item!);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        yield MealItemFetchError('Something went wrong.[${e.response!.statusCode}]');
      } else if (e.type == DioErrorType.other || e.type == DioErrorType.connectTimeout) {
        yield MealItemFetchError('Please check your internet connection.');

        if (e.type == DioErrorType.connectTimeout) {
          final CancelToken token = CancelToken();
          token.cancel("cancelled");
        }
      } else {
        yield MealItemFetchError('Something went wrong.');
      }
    }

    // catch (err) {
    //   print(err.toString());
    //   yield MealItemFetchError(err.toString());
    // }
  }
}
