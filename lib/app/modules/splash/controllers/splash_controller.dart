import 'package:androtell/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  void changeTheme() => isDark.value = !isDark.value;

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.HOME);
  }
}