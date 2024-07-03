
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  width: 415,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_beranda.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/logo_beranda.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ),
              ],

            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 80, top: 200),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 35, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                 Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],

                                  ),
                                  child: const Icon(
                                    Icons.cases_outlined,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(controller.currentDay.value),
                                    const SizedBox(height: 5),
                                    Text(controller.currentDate.value),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],

                                  ),
                                  child: const Icon(
                                    Icons.access_time_filled,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 10),
                               Text(controller.currentTime.value),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Silahkan",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Scan Voucher Anda",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25),
                      Image.asset(
                        "assets/barcode.png",
                        height: 150,
                        width: 150,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.navigateToScan(); // Navigate on button tap
                        },
                        child: Image.asset(
                          "assets/button_scan.png",
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}