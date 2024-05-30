import 'dart:async';
import 'package:esmartpms/view/parking_code/screens/result_screen.dart';
import 'package:esmartpms/view/parking_code/widgets/parking_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class ParkingCodeScreen extends StatefulWidget {
  const ParkingCodeScreen({super.key});

  @override
  State<ParkingCodeScreen> createState() => _ParkingCodeScreenState();
}

class _ParkingCodeScreenState extends State<ParkingCodeScreen> {
  final MobileScannerController controller = MobileScannerController(
    facing: CameraFacing.back,
    formats: [BarcodeFormat.qrCode],
    torchEnabled: false,
    detectionTimeoutMs: 10000,
    autoStart: false,
  );

  bool barcodeDetected = false;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    requestCameraPermission();
  }

  Future<void> requestCameraPermission() async {
    final cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus.isPermanentlyDenied || cameraPermissionStatus.isDenied) {
      if (mounted) {
        showPermissionAlert(context);
      }
    } else if (cameraPermissionStatus.isGranted) {
      controller.start();
    }
  }

  void showPermissionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Camera Permission"),
          content: const Text("Camera permission is required to scan QR codes."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 231, 201),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 2,
          automaticallyImplyLeading: false,
          title: Center(
            child: Image.asset(
              "assets/images/PMSlogo.png",
              fit: BoxFit.contain,
              height: size.height * 0.064,
              width: double.infinity,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "VIEW PARKING QR CODE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Complex No "),
                        SizedBox(height: 24),
                        Text("Floor "),
                        SizedBox(height: 24),
                        Text("Parking Spot "),
                        SizedBox(height: 24),
                        Text("Code "),
                        SizedBox(height: 24),
                      ],
                    ),
                    ParkingDataWidget(),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MobileScanner(
                      controller: controller,
                      overlayBuilder: (BuildContext context, BoxConstraints constraints) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.shadow,
                            width: 25,
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                      onDetect: (barcodeCapture) async {
                        if (!barcodeDetected) {
                          barcodeDetected = true;
                          final List<Barcode> barcodes = barcodeCapture.barcodes;
                          if (barcodes.isNotEmpty) {
                            final String qrScanValue = barcodes.first.rawValue ?? "No QR code value";
                            // Log the QR code value
                            print('QR Code Value: $qrScanValue');

                            // Navigate to the ResultScreen with the QR code value
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(qrCode: qrScanValue),
                              ),
                            );
                          } else {
                            // Log if no barcode is detected
                            print('No barcode detected');
                          }
                        }
                      },
                      errorBuilder: (context, error, child) {
                        return Text(error.toString());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
