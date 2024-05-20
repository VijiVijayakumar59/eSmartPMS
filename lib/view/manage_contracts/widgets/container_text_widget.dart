import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class ContainerTextWidget extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final double padding;
  final void Function()? onTap;
  const ContainerTextWidget({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.fontSize,
    required this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomText(
            text: text,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
