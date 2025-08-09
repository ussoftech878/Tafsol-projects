import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/home_controller.dart';
import 'package:wabisabi_mob_app/models/requests/change_password_request.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/services/user_services.dart';

class MyAccountController extends GetxController {
  RxDouble dailyLimit = 30.0.obs;
  RxDouble monthlyLimit = 300.0.obs;
  RxString selectedTimeFilter = 'Weekly Stats'.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  Rx<UserDetailsResponse> _userDetailsResponse = UserDetailsResponse().obs;
  UserServices _userServices = UserServices();

  @override
  void onInit() async {
    super.onInit();
    await GetUserDetails();
  }

  void setuserDetails(UserDetailsResponse userDetailsResponse) {
    _userDetailsResponse.value = userDetailsResponse;
  }

  UserDetailsResponse get userDetailsResponse => _userDetailsResponse.value;

  void updateSelectedFilter(String value) {
    selectedTimeFilter.value = value;
  }

  void updateDailyLimit(double value) {
    dailyLimit.value = value;
  }

  void updateMonthlyLimit(double value) {
    monthlyLimit.value = value;
  }

  final oldController = TextEditingController();
  final paswordController = TextEditingController();
  final confirmPaswordController = TextEditingController();

  // **Indicators for which field is active**
  RxBool isTypingPassword = false.obs;
  RxBool isTypingConfirmPassword = false.obs;

  // **Password Strength Indicator Variables**
  RxString passwordStrengthMessage = ''.obs;
  Rx<Color> passwordStrengthColor = Colors.grey.obs;
  RxString passwordMatchMessage = ''.obs;
  Rx<Color> passwordMatchColor = Colors.grey.obs;

  // **Real-Time Password Strength Checker**
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

  //API WORKINGS:
  Future<bool> ChangePassword() async {
    EasyLoading.show(status: 'loading...');

    try {
      final ChangePasswordRequest request = ChangePasswordRequest(
        email: userDetailsResponse.user!.email.toString(),
        oldPassword: oldController.text,
        newPassword: paswordController.text,
      );
      final response = await _userServices.ChangePassword(request);

      if (response.isSuccess!) {
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

  Future<bool> GetUserDetails() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _userServices.getuserDetails();

      if (response.isSuccess!) {
        setuserDetails(response);
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
}
