import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';

class CustomIngredientTile extends StatelessWidget {
  final String? data1;
  final String? data2;
  const CustomIngredientTile({
    Key? key,
    required this.data1,
    required this.data2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (data1!.isNotEmpty && data2!.isNotEmpty)
        ? ListTile(
            title: Text(data1!, style: kTextRegular.copyWith(fontWeight: FontWeight.w800)),
            trailing: Text(data2!, style: kTextRegular.copyWith(fontStyle: FontStyle.italic)),
          )
        : SizedBox.shrink();
  }
}
