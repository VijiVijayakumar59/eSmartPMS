import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:flutter/material.dart';

class KeyValueWidget extends StatelessWidget {
  final String head;
  final String value;
  const KeyValueWidget({
    super.key,
    required this.head,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Expanded(
              child: CustomText(
            text: head.trim(),
            fontWeight: FontWeight.w400,
            fontSize: 13,
          )),
          Expanded(
            child: CustomText(
              text: value.trim(),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
