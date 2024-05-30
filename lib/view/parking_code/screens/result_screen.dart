import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String qrCode;

  const ResultScreen({super.key, required this.qrCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Result"),
      ),
      body: Center(
        child: Text(
          'QR Code Value: $qrCode',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
