import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/input_controller.dart';

class InputView extends GetView<InputController> {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nomor Panggilan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          // Green background
          Container(
            color: Colors.green,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+62',
                            semanticsLabel: controller.phoneNumber.value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            controller.phoneNumber.value,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  _buildKeypad(context),
                  const SizedBox(height: 20),
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _keypadButton('1'),
            _keypadButton('2'),
            _keypadButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _keypadButton('4'),
            _keypadButton('5'),
            _keypadButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _keypadButton('7'),
            _keypadButton('8'),
            _keypadButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _keypadButton('*'),
            _keypadButton('0'),
            _keypadButton('#'),
          ],
        ),
      ],
    );
  }
  
  Widget _buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _callButton(Icons.phone, "Telpon \n Seluler"),
        _callButton(Icons.call_end, "Telpon \n Whatsapp"),
        _callButton(Icons.video_call, "Video Call \n Whatsapp")
      ],
    );
  }

  Widget _keypadButton(String label, {Color color = Colors.grey}) {
    return GestureDetector(
      onTap: () => controller.onKeyTap(label),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,

        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _callButton(IconData icon, String label, {Color color = Colors.green}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.navigateToCall();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(top: 15,left: 15,right: 15, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),

              ],
            ),
          ),
        ),

        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}
