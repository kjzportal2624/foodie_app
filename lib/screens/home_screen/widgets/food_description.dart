import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDescription extends StatelessWidget {
  final String title;
  final String price;

  const FoodDescription({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kTextFoodRegular.copyWith(fontSize: 16.0.sp),
              ),
              Padding(padding: EdgeInsets.only(bottom: 3.0)),
              Text(
                '₱ $price',
                style: kTextFoodRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0.sp,
                  color: kColorBlack2,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Cart', style: kTextFoodRegular.copyWith(color: kColorPrimary)),
                style: ElevatedButton.styleFrom(primary: kColorWhite),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Buy', style: kTextFoodRegular.copyWith(color: kColorWhite)),
                style: ElevatedButton.styleFrom(primary: kColorPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
