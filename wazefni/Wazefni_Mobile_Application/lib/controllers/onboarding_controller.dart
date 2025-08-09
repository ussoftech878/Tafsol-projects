import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_page4.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
      pageController.jumpToPage(
        currentIndex.value,
       /* duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,*/
      );
    } else {
      Get.toNamed(OnboardingPage4.routeName);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.jumpToPage(
        currentIndex.value,
       /* duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,*/
      );
    }
  }

  void skipToLast() {
    currentIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
