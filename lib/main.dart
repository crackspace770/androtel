import 'package:androtell/app/modules/call/bindings/call_binding.dart';
import 'package:androtell/app/modules/call/views/call_view.dart';
import 'package:androtell/app/modules/detail/bindings/detail_binding.dart';
import 'package:androtell/app/modules/detail/views/detail_view.dart';
import 'package:androtell/app/modules/home/controllers/home_controller.dart';
import 'package:androtell/app/modules/home/views/home_view.dart';
import 'package:androtell/app/modules/input/bindings/input_binding.dart';
import 'package:androtell/app/modules/input/views/input_view.dart';
import 'package:androtell/app/modules/scan/controllers/scan_controller.dart';
import 'package:androtell/app/modules/splash/controllers/splash_controller.dart';
import 'package:androtell/app/modules/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/scan/bindings/scan_binding.dart';
import 'app/modules/scan/views/scan_view.dart';
import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final splashController = Get.put(SplashController());
  final homeController = Get.put(HomeController());
  final scanController = Get.put(ScanController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: homeController.isDark.value ?? false ? ThemeData.dark() : ThemeData.light(), // Provide a default value or handle null safely
        initialRoute: Routes.SPLASH,
        getPages: [
          GetPage(name: Routes.SPLASH, page: () => SplashView(), binding: SplashBinding()),
          GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
          GetPage(name: Routes.SCAN, page: () => ScanView(), binding: ScanBinding()),
          GetPage(name: Routes.DETAIL, page: () => DetailView(), binding: DetailBinding()),
          GetPage(name: Routes.INPUT, page: () => InputView(), binding: InputBinding()),
          GetPage(name: Routes.CALL, page: () => CallView(), binding: CallBinding())
        ],
      ),
    );
  }
}