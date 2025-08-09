import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationsignupscreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Rx<int> tabIndex = 0.obs;
  RxBool isEnabled = false.obs;

  RxBool isPasswordVisible = false.obs;
  RxBool isPHPasswordVisible = false.obs;
}
