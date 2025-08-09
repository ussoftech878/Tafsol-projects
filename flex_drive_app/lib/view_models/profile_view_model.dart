import 'dart:convert';

import 'package:flexdrive/main.dart';
import 'package:flexdrive/models/response/my_profile_response.dart';
import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/services/api_base_helper.dart';
import 'package:flexdrive/services/auth_api_services.dart';
import 'package:flexdrive/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ProfileVeiwModel extends ChangeNotifier {
  bool get getIsloading => isLoading;
  AuthApiServices _authApiServices = AuthApiServices();
  bool get isLoading => _isLoadingbool;
  bool _isLoadingbool = false;
  ApiBaseHelper httpService = ApiBaseHelper();
  GetMyProfileModel get getMyProfileModel => _getMyProfileResponse;
  GetMyProfileModel _getMyProfileResponse = GetMyProfileModel();
  var context = navigatorKey.currentContext;

  setIsloadingBool(bool bool) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isLoadingbool = bool;
      notifyListeners();
    });
  }

  Future<bool> getMyProfile() async {
    setIsloadingBool(true);
    Response? response = await _authApiServices.getMyProfileInfo();
    if (response!.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      _getMyProfileResponse = GetMyProfileModel.fromJson(parsed);
      setIsloadingBool(false);
      return true;
    } else {
      setIsloadingBool(false);
      return false;
    }
  }

  logOutFunction() {
    context!.read<AuthViewModel>().callLogout().then((value) => {
          if (value)
            {
              Navigator.pushReplacementNamed(context!, loginRoute),
            }
        });
  }
}
