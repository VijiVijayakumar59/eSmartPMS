import 'package:flutter/material.dart';

class TextWithIconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color textColor;
  final double fontSize;
  final double width;
  final Color bgColor;
  final double height;
  final void Function()? onPressed;
  const TextWithIconWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.textColor,
    required this.fontSize,
    required this.width,
    this.onPressed,
    required this.height,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * width,
      height: size.height * height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            )
          ],
        ),
      ),
    );
  }
}
