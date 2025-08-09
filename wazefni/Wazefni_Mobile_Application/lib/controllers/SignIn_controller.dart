import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController PassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController PhonePassController = TextEditingController();

  // Change otpController to Rx<String> instead of Rx<TextEditingController>
  Rx<String> otpController = ''.obs;

  RxBool isEnabled = false.obs;
  Rx<int> tabIndex = 0.obs;
  RxBool isPasswordVisible = false.obs;
}
