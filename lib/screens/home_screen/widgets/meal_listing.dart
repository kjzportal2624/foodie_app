import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie_app/blocs/meal_bloc/meal_bloc.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:foodie_app/models/meal/meal.dart';
import 'package:foodie_app/screens/home_screen/widgets/food_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealListing extends StatelessWidget {
  const MealListing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<MealBloc, MealState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MealLoading) {
            return Center(
              child: SpinKitFadingCube(size: 40.h, color: kColorPrimary),
            );
          }

          if (state is MealFetched) {
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              children: state.mealResult
                  .map(
                    (MealData item) => FoodItem(
                      mealId: item.id,
                      imageUrl: item.mealThumbUrl,
                      title: item.mealTitle,
                      price: '50.00',
                    ),
                  )
                  .toList(),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
