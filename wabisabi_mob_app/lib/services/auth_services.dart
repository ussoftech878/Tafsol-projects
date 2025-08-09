import 'package:get/get.dart' hide Response;

import 'package:wabisabi_mob_app/models/requests/sign_in_request.dart';
import 'package:wabisabi_mob_app/models/requests/sign_up_request.dart';
import 'package:wabisabi_mob_app/models/requests/user_details_request.dart';
import 'package:wabisabi_mob_app/models/requests/validate_email_request.dart';
import 'package:wabisabi_mob_app/models/response/auth_response.dart';
import 'package:wabisabi_mob_app/models/response/base_response_model.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/services/api_base_helper.dart';
import 'package:wabisabi_mob_app/services/customPrint.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/utils/enums.dart';

class AuthService extends GetxService {
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  SessionStorageService _sessionStorageService = SessionStorageService();
  var isAuthenticated = false.obs;
  var platform = "".obs;

  String? authToken;

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.login,
        requestType: 'POST',
        params: '',
        requestBody: {"email": email, "password": password});
    if (response.data["isSuccess"]) {
      _sessionStorageService.saveToken(response.data["token"]);
    }
    isAuthenticated.value = true;
    return response.data;
  }

  Future<AuthResponse> signup(SignUpRequest signUpRequest) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.register,
        requestType: 'POST',
        params: '',
        requestBody: signUpRequest);

    isAuthenticated.value = true;

    AuthResponse parseddata = AuthResponse.fromJson(response);
    return parseddata;
  }

  Future<AuthResponse> signin(SignInRequest signInRequest) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.login,
        requestType: 'POST',
        params: '',
        requestBody: signInRequest);

    isAuthenticated.value = true;

    AuthResponse parseddata = AuthResponse.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> validateWabisabiId(String wabisabiId) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.validateWSID,
        requestType: 'POST',
        params: '',
        requestBody: {"wsid": wabisabiId});

    isAuthenticated.value = true;

    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> setIdPin(String wsid, String pin) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.setIdPin,
        requestType: 'PATCH',
        params: '',
        requestBody: {"ws_id": wsid, "pin": pin});

    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> forgetPassword(String email) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.forgotPassword,
        requestType: 'POST',
        params: '',
        requestBody: {"email": email});
    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel?> validateEmail(
      ValidateEmailRequest validateEmailRequest) async {
    // try {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.validateEmail,
        requestType: 'POST',
        params: '',
        requestBody: validateEmailRequest);
    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
    // } catch (e) {
    //   throw "Something went wrong";
    // }
  }

  Future<BaseResponseModel> verifyOtp(String email, String otp) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.verifyOTP,
        requestType: 'POST',
        params: '',
        requestBody: {"email": email, "otp": otp});
    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel> resendOtp(String email) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.resendOtp,
        requestType: 'POST',
        params: '',
        requestBody: {"email": email});
    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }

  Future<BaseResponseModel?> updatePhoneNumber(String number) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.updatePhoneNumber,
        requestType: 'PATCH',
        params: '',
        requestBody: {"phone_number": number});

    return BaseResponseModel.fromJson(response);
  }

  Future<BaseResponseModel> resetPassword(String email, String password) async {
    final response = await _apiBaseHelper.httpRequest(
        endpoint: EndPoints.resetPassword,
        requestType: 'POST',
        params: '',
        requestBody: {"email": email, "newPassword": password});

    BaseResponseModel parseddata = BaseResponseModel.fromJson(response);
    return parseddata;
  }
}

final AuthService authService = Get.find();
