import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodie_app/blocs/meal_item_bloc/meal_item_bloc.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:foodie_app/screens/food_item_detail_screen/widgets/custom_ingredient_tile.dart';
import 'package:foodie_app/screens/food_item_detail_screen/widgets/food_cover.dart';
import 'package:foodie_app/shared_widgets/account_drawer.dart';
import 'package:foodie_app/shared_widgets/custom_chip.dart';
import 'package:foodie_app/shared_widgets/text_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodItemDetailScreen extends StatefulWidget {
  final String mealId;
  final String mealTitle;

  const FoodItemDetailScreen({
    Key? key,
    required this.mealId,
    required this.mealTitle,
  }) : super(key: key);

  @override
  _FoodItemDetailScreenState createState() => _FoodItemDetailScreenState();
}

class _FoodItemDetailScreenState extends State<FoodItemDetailScreen> {
  @override
  void initState() {
    context.read<MealItemBloc>().add(FetchMealItem(widget.mealId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AccountDrawer(),
      appBar: AppBar(
        title: Text(widget.mealTitle),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<MealItemBloc, MealItemState>(
        builder: (context, state) {
          if (state is MealItemLoading) {
            return Center(
              child: SpinKitFadingCube(size: 40.h, color: kColorPrimary),
            );
          }

          if (state is MealItemFetched) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  FoodCover(mealId: state.item.mealId, url: state.item.mealImageUrl),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (state.item.tags != null)
                            ? Wrap(children: state.item.tags!.map((String tag) => CustomChip(text: tag)).toList())
                            : SizedBox.shrink(),
                        (state.item.tags != null) ? SizedBox(height: 25.0) : SizedBox.shrink(),
                        Text(state.item.mealTitle, style: kTitleHeading),
                        SizedBox(height: 15.0),
                        TextIcon(text: state.item.mealCategory, iconData: Icons.fastfood_outlined),
                        TextIcon(text: state.item.drinkAlternate ?? 'N/A', iconData: Icons.local_drink),
                        TextIcon(text: state.item.mealArea, iconData: Icons.location_city),
                        SizedBox(height: 25.0),
                        ExpansionTile(
                          title: Text("Ingredients", style: kTextBold),
                          children: <Widget>[
                            CustomIngredientTile(data1: state.item.mealIngredient1, data2: state.item.mealMeasure1),
                            CustomIngredientTile(data1: state.item.mealIngredient2, data2: state.item.mealMeasure2),
                            CustomIngredientTile(data1: state.item.mealIngredient3, data2: state.item.mealMeasure3),
                            CustomIngredientTile(data1: state.item.mealIngredient4, data2: state.item.mealMeasure4),
                            CustomIngredientTile(data1: state.item.mealIngredient5, data2: state.item.mealMeasure5),
                            CustomIngredientTile(data1: state.item.mealIngredient6, data2: state.item.mealMeasure6),
                            CustomIngredientTile(data1: state.item.mealIngredient7, data2: state.item.mealMeasure7),
                            CustomIngredientTile(data1: state.item.mealIngredient8, data2: state.item.mealMeasure8),
                            CustomIngredientTile(data1: state.item.mealIngredient9, data2: state.item.mealMeasure9),
                            CustomIngredientTile(data1: state.item.mealIngredient10, data2: state.item.mealMeasure10),
                            CustomIngredientTile(data1: state.item.mealIngredient11, data2: state.item.mealMeasure11),
                            CustomIngredientTile(data1: state.item.mealIngredient12, data2: state.item.mealMeasure12),
                            CustomIngredientTile(data1: state.item.mealIngredient13, data2: state.item.mealMeasure13),
                            CustomIngredientTile(data1: state.item.mealIngredient14, data2: state.item.mealMeasure14),
                            CustomIngredientTile(data1: state.item.mealIngredient15, data2: state.item.mealMeasure15),
                            CustomIngredientTile(data1: state.item.mealIngredient16, data2: state.item.mealMeasure16),
                            CustomIngredientTile(data1: state.item.mealIngredient17, data2: state.item.mealMeasure17),
                            CustomIngredientTile(data1: state.item.mealIngredient18, data2: state.item.mealMeasure18),
                            CustomIngredientTile(data1: state.item.mealIngredient19, data2: state.item.mealMeasure19),
                            CustomIngredientTile(data1: state.item.mealIngredient20, data2: state.item.mealMeasure20),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Text(state.item.mealInstructions, style: kTextRegular),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
