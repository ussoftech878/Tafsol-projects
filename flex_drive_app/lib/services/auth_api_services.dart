import 'dart:convert';

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
import 'package:flexdrive/services/api_base_helper.dart';
import 'package:flexdrive/utills/Colored_print.dart';
import 'package:flexdrive/utills/enums.dart';
import 'package:flexdrive/utills/shared_pref.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/view_models/profile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthApiServices {
  final context = navigatorKey.currentContext!;
  SharedPref _sharedPref = SharedPref();
  ApiBaseHelper _httpService = ApiBaseHelper();

  Future<AuthResponse> signInAPi({required SignInRequest signInRequest}) async {
    var addApi = context.read<AuthViewModel>().logInFunction;

    final response = await _httpService.httpRequest(
        endpoint: EndPoints.signIn,
        requestType: "POST",
        params: '',
        requestBody: signInRequest);

    final parsed = jsonDecode(response.body);

    AuthResponse authResponse = AuthResponse.fromJson(parsed);

    if (authResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
      ColoredPrint.green('${authResponse.data!.user!.email}');
      _sharedPref.save(Shared_pref_enum.authToken.value,
          authResponse.data!.token.toString());
    }

    return authResponse;
  }

  Future<BaseResponseModel> forgotPasswordApi(
      {required ForgotPasswordRequest forgotPasswordRequest}) async {
    var addApi = context.read<AuthViewModel>().forgotPasswordFuntion;

    final response = await _httpService.httpRequest(
        endpoint: EndPoints.forgotPassword,
        requestType: "POST",
        params: '',
        requestBody: forgotPasswordRequest);

    final parsed = jsonDecode(response.body);

    BaseResponseModel forgotPasswordResponse =
        BaseResponseModel.fromJson(parsed);
    if (forgotPasswordResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
    }
    return forgotPasswordResponse;
  }

  Future<BaseResponseModel> resendOpt(
      {required ResendOptRequest reSendOptRequest}) async {
    var addApi = context.read<AuthViewModel>().callSendingOtp;
    if (!context.read<ExceptionHandling>().listOfAPi.contains(addApi)) {
      context.read<ExceptionHandling>().listOfAPi.add(addApi);
    }
    final response = await _httpService.httpRequest(
        endpoint: EndPoints.resendopt,
        requestType: "POST",
        params: '',
        requestBody: reSendOptRequest);

    final parsed = jsonDecode(response.body);

    BaseResponseModel resendOtpResponse = BaseResponseModel.fromJson(parsed);
    if (resendOtpResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
    }

    return resendOtpResponse;
  }

  Future<BaseResponseModel> verifyOtpApi(
      {required VerifyOtpRequest verifyOtpRequest}) async {
    var addApi = context.read<AuthViewModel>().verifyOTPFunction;

    final response = await _httpService.httpRequest(
        endpoint: EndPoints.verifyOtp,
        requestType: "POST",
        params: '',
        requestBody: verifyOtpRequest);

    final parsed = jsonDecode(response.body);

    BaseResponseModel verifyOtpResponse = BaseResponseModel.fromJson(parsed);
    if (verifyOtpResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
    }

    return verifyOtpResponse;
  }

  Future<BaseResponseModel> callResetPasswordApi(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    var addApi = context.read<AuthViewModel>().resetPasswordFunction;

    final response = await _httpService.httpRequest(
        endpoint: EndPoints.resetPassword,
        requestType: "POST",
        params: '',
        requestBody: resetPasswordRequest);

    final parsed = jsonDecode(response.body);

    BaseResponseModel resetPasswordResponse =
        BaseResponseModel.fromJson(parsed);
    if (resetPasswordResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
    }
    return resetPasswordResponse;
  }

  Future<UpdatePasswordResponse> updatePasswordApi(
      {required UpdatePasswordRequest updatePasswordRequest}) async {
    var addApi = context.read<AuthViewModel>().updatePasswordFunction;

    final response = await _httpService.httpRequest(
        endpoint: EndPoints.updatePassword,
        requestType: "PATCH",
        params: '',
        requestBody: updatePasswordRequest);

    final parsed = jsonDecode(response.body);

    UpdatePasswordResponse updatePasswordResponse =
        UpdatePasswordResponse.fromJson(parsed);
    if (updatePasswordResponse.status! == "success") {
      context.read<ExceptionHandling>().listOfAPi.remove(addApi);
      ColoredPrint.green('${updatePasswordResponse.data!.user!.email}');
      _sharedPref.save(Shared_pref_enum.authToken.value,
          updatePasswordResponse.data!.token.toString());
    }

    return updatePasswordResponse;
  }

  Future<BaseResponseModel> logout() async {
    print(context.read<ExceptionHandling>().listOfAPi);
    Response response = await _httpService.httpRequest(
        endpoint: EndPoints.logOut,
        requestType: "POST",
        params: "",
        requestBody: {});
    final parsed = jsonDecode(response.body);

    BaseResponseModel baseResponse = BaseResponseModel.fromJson(parsed);

    if (baseResponse.status == "success") {
      context.read<ExceptionHandling>().listOfAPi.clear();
      _sharedPref.remove(Shared_pref_enum.authToken.value);
    }
    return baseResponse;
  }

  Future<Response?> getMyProfileInfo() async {
    try {
      var myProfile = context.read<ProfileVeiwModel>().getMyProfile;
      if (!context.read<ExceptionHandling>().listOfAPi.contains(myProfile)) {
        context.read<ExceptionHandling>().listOfAPi.add(myProfile);
      }
      Response response = await _httpService.httpRequest(
          endpoint: EndPoints.getMyProfile, requestType: "GET", params: "");
      if (response.statusCode == 200) {
        context.read<ExceptionHandling>().listOfAPi.remove(myProfile);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
