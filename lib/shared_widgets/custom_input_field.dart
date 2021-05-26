import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? textController;

  const CustomInputField({
    Key? key,
    this.labelText,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.padding = const EdgeInsets.only(bottom: 20.0),
    this.prefixText,
    this.inputFormatters,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLines,
    this.hintText,
    this.maxLength,
    this.validator,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: TextFormField(
        controller: textController,
        readOnly: readOnly!,
        onTap: onTap,
        keyboardType: keyboardType,
        maxLines: (!obscureText) ? maxLines : 1,
        textInputAction: textInputAction,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        maxLength: (!obscureText) ? maxLength : null,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixText: prefixText,
          prefixStyle: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
