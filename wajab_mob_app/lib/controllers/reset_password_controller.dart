import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/ccp_controller.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class ResetPasswordController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isEnabled = false.obs;

  Rx<TextEditingController> resetPhoneController = TextEditingController().obs;

  @override
  void onClose() {
    // Dispose the controller when not needed
    resetPhoneController.value.dispose();
    super.onClose();
  }

  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
  CcpController ccpController = Get.put(CcpController());
}
