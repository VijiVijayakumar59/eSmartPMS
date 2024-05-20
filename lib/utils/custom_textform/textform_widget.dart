import 'package:esmartpms/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CustomTextformWidget extends StatelessWidget {
  const CustomTextformWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.textColor,
    this.borderColor,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Color? textColor;
  final Color? borderColor;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: textColor,
          fontSize: 13,
          letterSpacing: 0.8,
        ),
        hintMaxLines: 1,
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: borderColor!),
        // ),
        // focusedBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: whiteColor),
        // ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
        ),
      ),
      style: const TextStyle(color: blackColor),
    );
  }
}
