import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmpolyerPhoneController extends GetxController {
  TextEditingController CompanyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isEnabled = false.obs;
}
