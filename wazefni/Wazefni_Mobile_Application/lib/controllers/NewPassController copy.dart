import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  RxBool isEnabled = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailController.clear();
  }
}
