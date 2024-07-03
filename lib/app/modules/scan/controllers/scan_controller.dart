import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../routes/app_routes.dart';

class ScanController extends GetxController {
  Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  RxBool isCameraInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initCamera();
  }

  @override
  void onClose() {
    super.onClose();
    cameraController.value?.dispose();
  }

  void initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController.value = CameraController(cameras[0], ResolutionPreset.medium);
      await cameraController.value!.initialize();
      isCameraInitialized.value = true;
    }
  }

  Future<void> captureImage() async {
    if (!isCameraInitialized.value || cameraController.value == null) return;

    try {
      final image = await cameraController.value!.takePicture();
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(await image.readAsBytes());

      Get.toNamed(Routes.DETAIL, arguments: imagePath);
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  void navigateToDetail() {
    captureImage();
  }
}