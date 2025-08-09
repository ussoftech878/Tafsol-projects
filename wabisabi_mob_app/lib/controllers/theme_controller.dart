import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Default theme mode (it can also be based on system settings)
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  // Function to toggle between dark and light theme
  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }
}
