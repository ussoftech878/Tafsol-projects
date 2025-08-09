import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class SignUpFormController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString selectedGender = ''.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
}
