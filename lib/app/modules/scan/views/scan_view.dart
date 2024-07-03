import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan Voucher',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Camera preview
          Obx(() {
            if (!controller.isCameraInitialized.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(controller.cameraController.value!),
                ),
              );
            }
          }),
          // Overlay
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Barcode area
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          size: 150,
                          color: Colors.green,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Letakkan Kode Dalam Bingkai',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                // Scan button
                ElevatedButton(
                  onPressed: () {
                    controller.navigateToDetail();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.green,
                  ),
                  child: const Icon(Icons.camera_alt, size: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}