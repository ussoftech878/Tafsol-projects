import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class HomeScreenController extends GetxController {
  var searchController = TextEditingController().obs;
  RxBool isFav = false.obs;
  var selectedDate = "February 2025".obs; // Default value
  var isBottomNavVisible = true.obs;
  RxDouble value = 40.0.obs;

  void selectDistance(String value) {
    this.value.value = double.parse(value);
  }

  void toggleBottomNavVisibility(bool isVisible) {
    isBottomNavVisible.value = isVisible;
  }

  void toggleFav() {
    isFav.value = !isFav.value;
  }

  @override
  void onClose() {
    searchController.value.dispose();
    super.onClose();
  }

  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
}
