import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployersignupscreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController PhomenameController = TextEditingController();
  TextEditingController PhonePasswordController = TextEditingController();
  TextEditingController PhonenumberController = TextEditingController();
  Rx<int> tabIndex = 0.obs;
  RxBool isEnabled = false.obs;

  RxBool isPasswordVisible = false.obs;
  RxBool isPHPasswordVisible = false.obs;
}
