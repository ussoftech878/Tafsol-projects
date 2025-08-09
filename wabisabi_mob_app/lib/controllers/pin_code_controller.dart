// pin_code_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/services/auth_services.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';

class PinCodeController extends GetxController {
  // Initialize with RxString instead of obs
  final pinCode = RxString('');
  final confirmPinCode = RxString('');
  final errorMessage = RxString('');
  final isPincodeValid = false.obs;
  final isConfirmPincodeValid = false.obs;
  AuthService _authService = AuthService();

  void updatePinCodeValidity(String value) {
    isPincodeValid.value = value.length == 5;
  }

  void updateConfirmPinCodeValidity(String value) {
    isConfirmPincodeValid.value = value.length == 5;
  }

  void validateConfirmPinCode() {
    if (confirmPinCode.value != pinCode.value) {
      // Changed to 5 to match Pinput length
      errorMessage.value = 'Pin code does not match';
    } else {
      errorMessage.value = '';
    }
  }

  void validatePinCode() {
    if (pinCode.value.length != 5) {
      // Changed to 5 to match Pinput length
      errorMessage.value = 'PIN code must be 5 digits';
    } else {
      errorMessage.value = '';
    }
  }

  Future<bool> setIdPin(String wsid) async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _authService.setIdPin(wsid, pinCode.value);

      if (response.isSuccess!) {
        //EasyLoading.showSuccess(response.message!);
        debugPrint(response.message.toString());
        setPinCode(pinCode.value);
        return true;
      } else {
        EasyLoading.showError(response.message.toString());
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  void setPinCode(String value) {
    pinCode.value = value;
    validatePinCode();
  }

  void setConfirmPinCode(String value) {
    confirmPinCode.value = value;
    validateConfirmPinCode();
  }
}
