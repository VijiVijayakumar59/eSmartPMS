// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';


// class ResultScreen extends StatelessWidget {
//   final String qrCode;

//   const ResultScreen({super.key, required this.qrCode});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Scan Result"),
//       ),
//       body: WebView(
//         initialUrl: qrCode, // Assuming qrCode contains the URL
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }