import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/models/requests/sign_in_request.dart';
import 'package:wabisabi_mob_app/models/response/auth_response.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';

import '../services/auth_services.dart';

class SignInController extends GetxController {
  //sign in
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //signup
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  // final signupEmailController = TextEditingController();
  // final phoneNumberController = TextEditingController();
  // final wabisabiIdController = TextEditingController();
  // final signupPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;
  AuthService _authService = AuthService();
  Rx<AuthResponse> _authResponse = AuthResponse().obs;
  SessionStorageService _sessionStorageService = SessionStorageService();
  void setAuthResponse(AuthResponse authResponse) {
    _authResponse.value = authResponse;
  }

  AuthResponse get authResponse => _authResponse.value;

  Future<bool> signin() async {
    EasyLoading.show(status: 'loading...');
    try {
      final signinRequest = SignInRequest(
          email: emailController.text, password: passwordController.text);

      final response = await _authService.signin(signinRequest);

      if (response.isSuccess!) {
        setAuthResponse(response);
        _sessionStorageService.saveToken(response.token!);
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

  void validateEmail() {}
}
