import 'package:androtell/app/routes/app_routes.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  var phoneNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onKeyTap(String key) {
    if (key == 'C') {
      phoneNumber.value = '';
    } else if (key == '<') {
      if (phoneNumber.isNotEmpty) {
        phoneNumber.value = phoneNumber.value.substring(0, phoneNumber.value.length - 1);
      }
    } else {
      phoneNumber.value += key;
    }
  }

  void navigateToCall() {
    Get.toNamed(Routes.CALL);
  }

}