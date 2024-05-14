import 'package:flutter/material.dart';

class KWidth extends StatelessWidget {
  final double size;

  const KWidth({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * size);
  }
}
