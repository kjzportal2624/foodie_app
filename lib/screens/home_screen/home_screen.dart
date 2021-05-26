import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:foodie_app/screens/home_screen/widgets/food_filter.dart';
import 'package:foodie_app/screens/home_screen/widgets/meal_listing.dart';
import 'package:foodie_app/shared_widgets/account_drawer.dart';
import 'package:foodie_app/shared_widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      endDrawer: AccountDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 20.0.h),
            FoodFilter(),
            MealListing(),
          ],
        ),
      ),
    );
  }
}
