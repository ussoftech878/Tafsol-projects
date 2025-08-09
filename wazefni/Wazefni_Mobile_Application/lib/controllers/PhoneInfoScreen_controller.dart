import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PhoneinfoscreenController extends GetxController {
  TextEditingController DOBController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool isEnabled = false.obs;
  var isMale = false.obs;

  var isFemale = false.obs;
}
