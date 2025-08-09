import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/view/auth_screens/login_with_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      print("SplashController initialized");
    } // Debugging print
    splashTimer();
  }

  void splashTimer() {
    Timer(const Duration(seconds: 3), () {
      if (kDebugMode) {
        print("Navigating to Login Screen");
      } // Debug statement

      Get.offNamed(LoginWithScreen.routeName);
    });
  }
}
