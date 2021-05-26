import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChip extends StatelessWidget {
  final String? text;
  final Color chipColor;

  const CustomChip({
    Key? key,
    required this.text,
    this.chipColor = kColorPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: chipColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          text!,
          style: kTextRegular.copyWith(color: kColorWhite, fontSize: 17.0.sp),
        ),
      ),
    );
  }
}
