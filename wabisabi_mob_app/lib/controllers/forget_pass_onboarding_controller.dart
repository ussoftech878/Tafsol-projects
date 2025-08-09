import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/services/auth_services.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';

class ForgetPasOnBoardingController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  Future<bool> forgetPassword() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await authService.forgetPassword(emailController.text);
      if (response.isSuccess!) {
        //EasyLoading.showSuccess(response.message!);
        debugPrint(response.message.toString());
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

  Future<bool> resetPassword() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await authService.resetPassword(
          emailController.text, paswordController.text);
      if (response.isSuccess!) {
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

  Future<bool> verifyOtp() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response =
          await authService.verifyOtp(emailController.text, otpController.text);
      if (response.isSuccess!) {
        //EasyLoading.showSuccess(response.message!);
        debugPrint(response.message.toString());
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

  void nextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Get.toNamed(WelcomeScreen.routeName);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLast() {
    currentIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final isOtpValid = false.obs;
  final paswordController = TextEditingController();
  final confirmPaswordController = TextEditingController();

  // **Indicators for which field is active**
  RxBool isTypingPassword = false.obs;
  RxBool isTypingConfirmPassword = false.obs;

  // **Password Strength Indicator Variables**
  RxString passwordStrengthMessage = ''.obs;
  Rx<Color> passwordStrengthColor = Colors.grey.obs;

  //otp timer variables
  RxInt timer = 60.obs;
  RxBool isResendEnabled = false.obs;
  Timer? _otpTimer;

  void startOtpTimer() {
    isResendEnabled.value = false;
    timer.value = 60;

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

  void resendOtp() {
    if (isResendEnabled.value) {
      startOtpTimer();
    }
  }

  // **Real-Time Password Strength Checker**
  String? checkPasswordStrength(String password) {
    if (password.isEmpty) {
      return null; // No error message if the field is empty
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'(?=.*[!@#$%^&*])').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }
    return null; // No error message if the password is strong
  }

  // **Confirm Password Validation**
  String? checkConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return null; // No error message if the field is empty
    }

    if (confirmPassword != paswordController.text) {
      return 'Passwords do not match';
    }
    return null; // No error message if passwords match
  }

  @override
  void onClose() {
    _otpTimer?.cancel(); // Cancel timer when controller is closed
    pageController.dispose();
    emailController.dispose();
    otpController.dispose();
    paswordController.dispose();
    confirmPaswordController.dispose();
    super.onClose();
  }
}
