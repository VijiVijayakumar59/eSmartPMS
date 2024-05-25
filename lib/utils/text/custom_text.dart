import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.height,
    this.maxLines,
    this.textDecoration,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.trim(),
      style: TextStyle(
        decoration: textDecoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        overflow: overflow,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
