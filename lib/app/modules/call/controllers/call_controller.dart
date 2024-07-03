import 'dart:async';

import 'package:androtell/app/routes/app_routes.dart';
import 'package:get/get.dart';

class CallController extends GetxController {
  var remainingTime = 600.obs;
  var progress = 1.0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
        progress.value = remainingTime.value / 600;
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void endCall() {
    timer?.cancel();
    remainingTime.value = 600;
    progress.value = 1.0;
    startTimer();
    Get.toNamed(Routes.INPUT);
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
