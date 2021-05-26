import 'package:flutter/material.dart';
import 'package:foodie_app/blocs/meal_bloc/meal_bloc.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodFilter extends StatefulWidget {
  const FoodFilter({
    Key? key,
  }) : super(key: key);

  @override
  _FoodFilterState createState() => _FoodFilterState();
}

class _FoodFilterState extends State<FoodFilter> {
  int selectedFilterIndex = 0;
  List<Map<String, dynamic>> filters = [
    {'title': 'Seafood'},
    {'title': 'Beef'},
  ];

  @override
  void initState() {
    /// Trigger filter search initially
    context.read<MealBloc>().add(FetchMeals('Seafood'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 20.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(color: kColorGrey2, borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: filters
              .asMap()
              .map((int index, Map<String, dynamic> filterData) => MapEntry(
                    index,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: ChoiceChip(
                        onSelected: (bool isSelected) async {
                          if (isSelected) {
                            setState(() {
                              selectedFilterIndex = index;
                            });

                            context.read<MealBloc>().add(FetchMeals(filters[index]['title']));
                          }
                        },
                        selected: selectedFilterIndex == index,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        selectedColor: kColorWhite,
                        disabledColor: kColorGrey2,
                        backgroundColor: kColorGrey2,
                        labelPadding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 40.0.w),
                        label: Text(
                          filters[index]['title'],
                          style: kTextBold.copyWith(
                            color: (selectedFilterIndex == index) ? kColorBlack : kColorGrey,
                          ),
                        ),
                        labelStyle: kTextRegular,
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
