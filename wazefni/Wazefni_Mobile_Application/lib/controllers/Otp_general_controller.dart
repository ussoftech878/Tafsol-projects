import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

class OtpGeneralController extends GetxController {
  Rx<String> otpController = ''.obs;
  RxBool isEnabled = false.obs;
  Languagecontroller lang_controller = Get.put(Languagecontroller());

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  late Timer timer;
  int start = 60;
  bool timerCompleted = false;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start == 0) {
        timerCompleted = true;
        timer.cancel();
      } else {
        // setState(() {
        start--;
      }
    });
  }
}
