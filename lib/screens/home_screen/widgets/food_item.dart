import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_app/screens/food_item_detail_screen/food_item_detail_screen.dart';
import 'package:foodie_app/screens/home_screen/widgets/food_description.dart';

class FoodItem extends StatelessWidget {
  final String mealId;
  final String imageUrl;
  final String title;
  final String price;

  const FoodItem({
    Key? key,
    required this.mealId,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodItemDetailScreen(
                mealId: mealId,
                mealTitle: title,
              ),
            ),
          );
        },
        child: SizedBox(
          height: 130.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Hero(
                  tag: mealId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrl,
                      progressIndicatorBuilder: (_, url, __) {
                        return Center(
                          child: SpinKitFadingCircle(size: 40.h, color: kColorPrimary),
                        );
                      },
                      errorWidget: (context, url, error) => Icon(Icons.error, size: kIconSize),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                  child: FoodDescription(title: title, price: price),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
