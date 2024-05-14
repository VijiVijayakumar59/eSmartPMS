import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final int? maxLines;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.trim(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
