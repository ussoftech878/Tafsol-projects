import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmailInfoScreenController extends GetxController {
  TextEditingController DOBController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isEnabled = false.obs;
  var isMale = false.obs;

  var isFemale = false.obs;
}
