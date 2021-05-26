import 'package:flutter/material.dart';
import 'package:foodie_app/constants/style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color buttonColor;

  const CustomButton({
    Key? key,
    this.title,
    this.onPressed,
    this.buttonColor = kColorPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          buttonColor,
        ),
      ),
      child: Container(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title!,
              style: kTextRegular,
            ),
          ),
        ),
      ),
    );
  }
}
