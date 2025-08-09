import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassPhoneOtpController extends GetxController {
  final otp = TextEditingController();
  Rx<String> phoneOtpController = ''.obs;
  RxBool isEnabled = false.obs;
}
