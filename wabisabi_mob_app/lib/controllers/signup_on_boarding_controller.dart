import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/models/requests/sign_up_request.dart';
import 'package:wabisabi_mob_app/models/requests/validate_email_request.dart';
import 'package:wabisabi_mob_app/models/response/auth_response.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/utils/custom_snackbar.dart';
import '../services/auth_services.dart';

class SignUpOnboardingController extends GetxController {
  final AuthService _authService = AuthService();
  final Rx<AuthResponse> _authResponse = AuthResponse().obs;
  final SessionStorageService _sessionStorageService = SessionStorageService();

  RxInt currentIndex = 0.obs;
  late PageController pageController;
  RxString countryCode1 = '+92'.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isTypingPassword = false.obs;
  RxBool isTypingConfirmPassword = false.obs;
  RxString passwordStrengthMessage = ''.obs;
  Rx<Color> passwordStrengthColor = Colors.grey.obs;
  RxString countryCode = '34'.obs;
  RxBool isCountryCodeValid = false.obs;

  void setAuthResponse(AuthResponse authResponse) {
    _authResponse.value = authResponse;
  }

  AuthResponse get authResponse => _authResponse.value;

  void setCountryCode1(String code) {
    countryCode.value = code;
    isCountryCodeValid.value = true;
  }

  Future<bool> validate_email() async {
    EasyLoading.show(status: 'loading...');
    try {
      final ValidateEmailRequest validateEmailRequest =
          ValidateEmailRequest(email: emailController.text);

      final response = await _authService.validateEmail(validateEmailRequest);
      ColoredPrint.yellow(response!.isSuccess.toString());
      if (response.isSuccess!) {
        //EasyLoading.showSuccess(response.message!);
        debugPrint(response.message.toString());
        return true;
      } else {
        // EasyLoading.showError(response.message.toString());
        return false;
      }
    } catch (e) {
      // EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<bool> updatePhoneNumber() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _authService
          .updatePhoneNumber(countryCode.value + phoneNumberController.text);

      if (response!.isSuccess!) {
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

  Future<bool> updateWabisabiId() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response =
          await _authService.validateWabisabiId(wabisabiIdController.text);

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

  Future<bool> signup() async {
    EasyLoading.show(status: 'loading...');
    try {
      final signupRequest = SignUpRequest(
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          password: passwordController.text);

      final response = await _authService.signup(signupRequest);

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
      ColoredPrint.yellow(e.toString());
      EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

// Method to update the country code
  void setCountryCode(String code) {
    countryCode.value = code;
  }

  void nextPage() {
    if (currentIndex.value < 4) {
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

  void disposeControllers() {
    pageController.dispose();
    super.onClose();
  }

  //------------------------------------signup screen-------------------------------------------
  // Define text controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final wabisabiIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // // Dispose controllers to avoid memory leaks
  // @override
  // void onClose() {
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   emailController.dispose();
  //   phoneNumberController.dispose();
  //   wabisabiIdController.dispose();
  //   passwordController.dispose();

  //   super.onClose();
  // }

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

    if (confirmPassword != passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // No error message if passwords match
  }
}
