import 'dart:async';
import 'dart:io';

import 'package:flexdrive/main.dart';
import 'package:flexdrive/models/requests/Sign_in_request.dart';
import 'package:flexdrive/models/requests/forgot_password_request.dart';
import 'package:flexdrive/models/requests/resend_opt_request.dart';
import 'package:flexdrive/models/requests/reset_password_request.dart';
import 'package:flexdrive/models/requests/update_password_request.dart';
import 'package:flexdrive/models/requests/verify_otp_request.dart';
import 'package:flexdrive/models/response/auth_response.dart';
import 'package:flexdrive/models/response/base_response_model.dart';
import 'package:flexdrive/models/response/update_password_response.dart';
import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/services/auth_api_services.dart';
import 'package:flexdrive/utills/Colored_print.dart';
import 'package:flexdrive/utills/shared_pref.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';
import 'package:flexdrive/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  SharedPref _sharedPref = SharedPref();
  AuthApiServices _authApiServices = AuthApiServices();
  AuthResponse _authResponse = AuthResponse();
  BaseResponseModel _forgotPasswordResponse = BaseResponseModel();
  BaseResponseModel _verfiyotpResponse = BaseResponseModel();
  BaseResponseModel _reSendOptRespone = BaseResponseModel();
  BaseResponseModel get getReSendOptRespone => _reSendOptRespone;
  BaseResponseModel _resetPasswordResponse = BaseResponseModel();
  UpdatePasswordResponse _updatePasswordResponse = UpdatePasswordResponse();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ConfirmPasswordController = TextEditingController();
  TextEditingController _currrentPasswordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController get getotpController => _otpController;
  TextEditingController get getemailController => _emailController;
  TextEditingController get getPasswordController => _passwordController;
  TextEditingController get getConfirmPasswordController =>
      _ConfirmPasswordController;
  TextEditingController get getcurrrentPasswordController =>
      _currrentPasswordController;
  AuthResponse get getAuthResponse => _authResponse;
  String _currrentPasswordFieldError = '';
  String _emailFieldError = '';
  String _passwordFieldError = '';
  String _ConfirmPasswordFieldError = '';
  bool _securePassword = true;
  bool _currentPassword = true;
  bool _confrimPassword = true;
  BaseResponseModel get getVerfiyotpResponse => _verfiyotpResponse;
  BaseResponseModel get getForgotPasswordResponse => _forgotPasswordResponse;
  BaseResponseModel get getResetPasswordResponse => _resetPasswordResponse;
  UpdatePasswordResponse get getUpdatePasswordResponse =>
      _updatePasswordResponse;
  String get getcurrrentPasswordFieldError => _currrentPasswordFieldError;
  String get getemailFieldError => _emailFieldError;
  String get getpasswordFieldError => _passwordFieldError;
  String get getConfirmPasswordFieldError => _ConfirmPasswordFieldError;
  bool get getsecurePassword => _securePassword;
  bool get getSecureConfrimPassword => _confrimPassword;
  bool get getSecureCurrentPassword => _currentPassword;
  bool get isResendButtonEnabled => _isResendButtonEnabled;
  Timer? _otpTimer;
  int _remainingTime = 120;
  bool _isResendButtonEnabled = true;
  BaseResponseModel baseResponseModel = BaseResponseModel();
  // Getters
  String get formattedTime {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}s";
  }

  //timer function
  void startOtpTimer() {
    _remainingTime = 120; // Reset timer to 60 seconds
    _isResendButtonEnabled = false; // Disable the resend button
    notifyListeners(); // Notify listeners to disable the button UI
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners(); // Update UI with remaining time
      } else {
        _otpTimer?.cancel();
        _isResendButtonEnabled = true; // Enable the button once timer ends
        notifyListeners(); // Notify listeners to enable the button
      }
    });
  }

  void setSecurePassword() {
    _securePassword = !_securePassword;
    notifyListeners();
  }

  void setSecureConfrimPassword() {
    _confrimPassword = !_confrimPassword;
    notifyListeners();
  }

  void setSecureCurrentPassword() {
    _currentPassword = !_currentPassword;
    notifyListeners();
  }

  void setEmailFieldError(String value) {
    _emailFieldError = value;
    notifyListeners();
  }

  void setPasswordFieldError(String value) {
    _passwordFieldError = value;
    notifyListeners();
  }

  void setConfirmPasswordFieldError(String value) {
    _ConfirmPasswordFieldError = value;
    notifyListeners();
  }

  void setcurrrentPasswordFieldError(String value) {
    _currrentPasswordFieldError = value;
    notifyListeners();
  }

  void setAuthResponse(AuthResponse value) {
    _authResponse = value;
    notifyListeners();
  }

  void forgotPasswordResponse(BaseResponseModel value) {
    _forgotPasswordResponse = value;
    notifyListeners();
  }

  void reSendOptResponse(BaseResponseModel value) {
    _reSendOptRespone = value;
  }

  void verfiyOtpResponse(BaseResponseModel value) {
    _verfiyotpResponse = value;
    notifyListeners();
  }

  void resetPasswordResponse(BaseResponseModel value) {
    _resetPasswordResponse = value;
    notifyListeners();
  }

  void updatePasswordResponse(UpdatePasswordResponse value) {
    _updatePasswordResponse = value;
    notifyListeners();
  }

  bool passwordValidation() {
    if (_passwordController.text.isEmpty) {
      setPasswordFieldError('Please Enter Password');
      return false;
    } else if (_passwordController.text.length < 8) {
      setPasswordFieldError('Password length must be of 8 characters or more');
      return false;
    } else {
      setPasswordFieldError('');
      return true;
    }
  }

  bool currentPasswordValidation() {
    if (_currrentPasswordController.text.isEmpty) {
      setcurrrentPasswordFieldError('Please Enter Current Password');
      return false;
    } else if (_currrentPasswordController.text.length < 8) {
      setcurrrentPasswordFieldError(
          'Password length must be of 8 characters or more');
      return false;
    } else {
      setcurrrentPasswordFieldError('');
      return true;
    }
  }

  bool confirmPasswordValidation() {
    if (_ConfirmPasswordController.text.isEmpty) {
      setConfirmPasswordFieldError('Password didn\'t matched');
      return false;
    } else if (_ConfirmPasswordController.text != _passwordController.text) {
      setConfirmPasswordFieldError('Password didn\'t matched');
      return false;
    } else {
      setConfirmPasswordFieldError('');
      return true;
    }
  }

  bool emailValidation() {
    if (_emailController.text.isEmpty) {
      setEmailFieldError('Please Enter Email');
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)) {
      setEmailFieldError('Please Enter Valid Email');
      return false;
    } else {
      setEmailFieldError('');
      return true;
    }
  }

  bool signInValidation() {
    if (emailValidation() && passwordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  bool changePasswordValidation() {
    if (passwordValidation() && confirmPasswordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  bool updatePasswordValidation() {
    if (currentPasswordValidation() &&
        passwordValidation() &&
        confirmPasswordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> callSignInApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final SignInRequest signInRequest = SignInRequest(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final AuthResponse response =
          await _authApiServices.signInAPi(signInRequest: signInRequest);

      if (response.status == "success") {
        setAuthResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  void clearFieldsData() {
    _emailController.clear();
    _passwordController.clear();
    _ConfirmPasswordController.clear();
    _currrentPasswordController.clear();
    _otpController.clear();
    setEmailFieldError('');
    setPasswordFieldError('');
    setConfirmPasswordFieldError('');
    setcurrrentPasswordFieldError('');
  }

  Future<bool> callForgotPasswordApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest(
        email: _emailController.text,
      );

      final BaseResponseModel response = await _authApiServices
          .forgotPasswordApi(forgotPasswordRequest: forgotPasswordRequest);

      if (response.status == "success") {
        forgotPasswordResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callVerifyOTP() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final VerifyOtpRequest verifyOtpRequest = VerifyOtpRequest(
          code: _otpController.text,
          email: _emailController.text,
          fromForgotPassword: true);
      final BaseResponseModel response = await _authApiServices.verifyOtpApi(
          verifyOtpRequest: verifyOtpRequest);

      if (response.status == "success") {
        verfiyOtpResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callSendingOtp() async {
    EasyLoading.show(status: 'Sending OTP');
    try {
      final ResendOptRequest reSendOptRequest = ResendOptRequest(
        email: _emailController.text,
      );

      final BaseResponseModel response =
          await _authApiServices.resendOpt(reSendOptRequest: reSendOptRequest);

      if (response.status == "success") {
        reSendOptResponse(response);
        startOtpTimer();

        //restartTimer();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError(response.message.toString());
        //resetTimer();
        return false;
      }
    } catch (exception) {
      //resetTimer();
      EasyLoading.showError(exception.toString());
      return false;
    }
  }

  Future<bool> callResetPassword() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final ResetPasswordRequest verifyOtpRequest = ResetPasswordRequest(
          code: _otpController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _ConfirmPasswordController.text);
      final BaseResponseModel response = await _authApiServices
          .callResetPasswordApi(resetPasswordRequest: verifyOtpRequest);

      if (response.status == "success") {
        resetPasswordResponse(response);
        clearFieldsData();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callUpdatePasswordApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final UpdatePasswordRequest updatePasswordRequest = UpdatePasswordRequest(
          currentPassword: _currrentPasswordController.text,
          password: _passwordController.text,
          confirmPassword: _ConfirmPasswordController.text);
      final UpdatePasswordResponse response = await _authApiServices
          .updatePasswordApi(updatePasswordRequest: updatePasswordRequest);

      if (response.status == "success") {
        updatePasswordResponse(response);
        EasyLoading.dismiss();

        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callLogout() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final BaseResponseModel response = await _authApiServices.logout();
      if (response.status == "success") {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("${response.message}");
        return false;
      }
    } on SocketException catch (e) {
      ColoredPrint.green("$e");
      return false;
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  logInFunction() {
    callSignInApi().then((value) => {
          if (value)
            {
              clearFieldsData(),
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, navBarRoute),
            }
        });
  }

  forgotPasswordFuntion() {
    callForgotPasswordApi().then((value) => {
          if (value)
            {Navigator.pushNamed(navigatorKey.currentContext!, otpRoute)}
        });
  }

  verifyOTPFunction() {
    callVerifyOTP().then((value) => {
          if (value)
            {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, resetPasswordRoute)
            }
        });
  }

  resetPasswordFunction() {
    callResetPassword().then((value) => {
          if (value)
            {
              Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
                  passwordChangedRoute, (Route<dynamic> route) => false)
            }
        });
  }

  updatePasswordFunction() {
    callUpdatePasswordApi().then((value) => {
          if (value)
            {
              EasyLoading.showSuccess("Password successfully updated."),
              clearFieldsData(),
              // Navigator.pushNamedAndRemoveUntil(
              //     context, passwordChangedRoute, (Route<dynamic> route) => false)
            }
        });
  }
}
