import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/login_with_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/bot_nav_bar.dart';

class SplashController extends GetxController {
  SessionStorageService sessionStorageService = SessionStorageService();
  @override
  void onInit() {
    super.onInit();

    splashTimer();
  }

  void splashTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (kDebugMode) {
        print("Navigating to Login Screen");
      }

      _navigateToLogin();
    });
  }

  void _navigateToLogin() async {
    // Notify listeners to navigate to the login screen

    Get.offNamed(await sessionStorageService.hasToken()
        ? BotNavBar.routeName
        : LoginWithScreen.routeName);
  }
}
