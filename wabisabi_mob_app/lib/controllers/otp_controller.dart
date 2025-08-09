import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/services/auth_services.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';

class OtpController extends GetxController {
  AuthService _authService = AuthService();
  final otpController = TextEditingController();
  SignUpOnboardingController signUpController =
      Get.find<SignUpOnboardingController>();

  final isOtpValid = false.obs;

  // OTP timer variables
  RxInt timer = 120.obs; // 2 minutes in seconds
  RxBool isResendEnabled = false.obs;
  Timer? _otpTimer;

  String get formattedTime {
    int minutes = timer.value ~/ 60;
    int seconds = timer.value % 60;
    return '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startOtpTimer() {
    isResendEnabled.value = false;
    timer.value = 120; // Reset to 2 minutes

    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.timer.value > 0) {
        this.timer.value--;
      } else {
        _otpTimer?.cancel();
        isResendEnabled.value = true;
      }
    });
  }

  void resendOtp(String email) {
    if (isResendEnabled.value) {
      startOtpTimer();
      resendotp(email);
    }
  }

  void updateOtpValidity(String value) {
    isOtpValid.value = value.length == 4;
  }

  Future<bool> resendotp(String email) async {
    try {
      EasyLoading.show(status: 'loading...');
      final response = await _authService.resendOtp(email);
      if (response.isSuccess!) {
        EasyLoading.showSuccess(response.message!);
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

  Future<bool> verifyotp(String email) async {
    try {
      EasyLoading.show(status: 'loading...');
      final response = await _authService.verifyOtp(email, otpController.text);
      if (response.isSuccess!) {
        EasyLoading.showSuccess(response.message!);
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

  @override
  void onClose() {
    _otpTimer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
