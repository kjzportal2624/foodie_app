import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie_app/constants/style.dart';

class FoodCover extends StatelessWidget {
  final String? mealId;
  final String? url;

  const FoodCover({
    Key? key,
    required this.mealId,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: mealId!,
      child: Container(
        height: 0.35.sh,
        width: double.infinity,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url!,
          progressIndicatorBuilder: (_, url, __) {
            return Center(child: SpinKitFadingCircle(size: 40.h, color: kColorPrimary));
          },
          errorWidget: (context, url, error) => Icon(Icons.error, size: kIconSize),
        ),
      ),
    );
  }
}
