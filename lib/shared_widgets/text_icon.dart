import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';

class TextIcon extends StatelessWidget {
  final String? text;
  final IconData? iconData;

  const TextIcon({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(iconData!, size: kIconSize),
          SizedBox(width: 10.0),
          Text(
            text!,
            style: kTextRegular.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
