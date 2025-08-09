import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final PHfullnameController = TextEditingController();
  final PHphoneController = TextEditingController();
  final PHpasswordController = TextEditingController();
  Rx<int> tabIndex = 0.obs;
  RxBool isEnabled = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isPHPasswordVisible = false.obs;



}
