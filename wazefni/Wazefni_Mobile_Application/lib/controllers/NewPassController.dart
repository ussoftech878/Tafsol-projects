import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Newpasscontroller extends GetxController {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  RxBool isEnabled = false.obs;
  RxBool isPasswordVisible1 = false.obs;
  RxBool isPasswordVisible2 = false.obs;
}
