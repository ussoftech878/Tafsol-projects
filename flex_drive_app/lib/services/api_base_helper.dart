import 'dart:convert';
import 'dart:io';

import 'package:flexdrive/main.dart';
import 'package:flexdrive/models/response/auth_response.dart';
import 'package:flexdrive/services/error_handling.dart';
import 'package:flexdrive/utills/enums.dart';
import 'package:flexdrive/utills/shared_pref.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/widgets/custom_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiBaseHelper {
  final String _baseUrl =
      "https://flexdrive-backend-b11-30e7d9c327b8.herokuapp.com";

  AuthResponse authResponse = AuthResponse();
  SharedPref _sharedPref = SharedPref();
  ErrorHandling checkError = ErrorHandling();
  String? authtoken;
  var navigator = navigatorKey.currentContext!;

  Future<dynamic> httpRequest(
      {required EndPoints endpoint,
      required String requestType,
      var requestBody,
      required String params,
      String? imagePath}) async {
    authtoken =
        await _sharedPref.read(Shared_pref_enum.authToken.value.toString());
    try {
      switch (requestType) {
        case "POST":
          final responseJson = await http.post(
            Uri.parse(_baseUrl + endpoint.url),
            headers: getHeaders(),
            body: jsonEncode(requestBody),
          );
          checkError.errorHandling(responseCode: responseJson.statusCode);
          return responseJson;
        case 'GET':
          final responseJson = await http.get(
            Uri.parse(_baseUrl + endpoint.url + params),
            headers: getHeaders(),
          );
          checkError.errorHandling(responseCode: responseJson.statusCode);
          return responseJson;
        case 'PUT':
          final responseJson = await http.put(
              Uri.parse(_baseUrl + endpoint.url + params),
              headers: getHeaders(),
              body: requestBody != '' ? jsonEncode(requestBody) : null);
          checkError.errorHandling(responseCode: responseJson.statusCode);
          return responseJson;
        case "PATCH":
          final responseJson = await http.patch(
              Uri.parse(_baseUrl + endpoint.url + params),
              headers: getHeaders(),
              body: requestBody != '' ? jsonEncode(requestBody) : null);
          checkError.errorHandling(responseCode: responseJson.statusCode);
          return responseJson;
      }
    } on SocketException catch (e) {
      if (e.message ==
          "Failed host lookup: 'flexdrive-backend-b11-30e7d9c327b8.herokuapp.com'") {
        if (navigator.read<ExceptionHandling>().getShowDialogBox == true) {
          navigator.read<ExceptionHandling>().setShowDialogBoxBool(false);
          customShowDialog(navigator,
              title: "No Internet",
              message: "Please Check Your Connection", onOk: () {
            navigator.read<ExceptionHandling>().setShowDialogBoxBool(true);
            navigator.read<ExceptionHandling>().runAllApis();
          }, onCancel: () {
            navigator.read<ExceptionHandling>().setShowDialogBoxBool(true);
          });
        }
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${authtoken ?? ""}');

    return headers;
  }
}
