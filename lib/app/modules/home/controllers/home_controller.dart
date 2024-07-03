import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_routes.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

  var currentTime =''.obs;
  var currentDate = ''.obs;
  var currentDay = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateTime();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var isDark = false.obs;

  void changeTheme() => isDark.value = !isDark.value;

  @override
  void onClose() {
    super.onClose();
  }

  void updateTime() {
    DateTime now = DateTime.now();
    currentDate.value = DateFormat('dd-MM-yyyy').format(now);
    currentDay.value = DateFormat('EEEE').format(now);
    currentTime.value = DateFormat('HH:mm:ss').format(now);

    Future.delayed(Duration(seconds: 1), updateTime); // Update time every second;
  }

  void navigateToScan() {
    Get.toNamed(Routes.SCAN); // Navigate to ScanView
  }

}
