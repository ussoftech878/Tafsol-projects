import 'dart:convert';


import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/utils/enums.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiBaseHelper {
  /* static final String _baseUrl =
      "https://flexdrive-backend-b11-30e7d9c327b8.herokuapp.com/api/v1/"; */
  final _baseURL = BaseUrls.prodUrl.url;
  /* SharedPref sharedPref = SharedPref(); */
  SessionStorageService tokenStorage = SessionStorageService();

  String? authtoken;

  Future<bool> isOnline() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> httpRequest(
      {required EndPoints endpoint,
      required String requestType,
      var requestBody,
      required String params,
      String? imagePath}) async {
    authtoken = await tokenStorage.getToken();
    if (!await isOnline()) {
      EasyLoading.showError("no internet connection");
      // CustomSnackbar.showError("Error", );
    } else {
      try {
        switch (requestType) {
          case 'GET':
            final responseJson = await http.get(
                Uri.parse(_baseURL + endpoint.url + params),
                headers: getHeaders());

            return jsonDecode(responseJson.body);
          case 'POST':
            final responseJson = await http.post(
                Uri.parse(_baseURL + endpoint.url),
                headers: getHeaders(),
                body: jsonEncode(requestBody));

            return jsonDecode(responseJson.body);
          case 'PUT':
            final responseJson = await http.put(
                Uri.parse(_baseURL + endpoint.url + params),
                headers: getHeaders(),
                body: requestBody != '' ? jsonEncode(requestBody) : null);

            return jsonDecode(responseJson.body);
          case 'DEL':
            final responseJson = await http.delete(
              Uri.parse(_baseURL + endpoint.url + params),
              headers: getHeaders(),
            );

            return jsonDecode(responseJson.body);

          case "PATCH":
            final responseJson = await http.patch(
                Uri.parse(_baseURL + endpoint.url + params),
                headers: getHeaders(),
                body: requestBody != '' ? jsonEncode(requestBody) : null);

            return jsonDecode(responseJson.body);
          case 'MULTIPART':
            final request = http.MultipartRequest(
                'POST', Uri.parse(_baseURL + endpoint.url));
            request.fields.addAll(requestBody!.toJson());
            request.files
                .add(await http.MultipartFile.fromPath('image', imagePath!));
            request.headers.addAll(getHeaders());
            final responseJson = await request.send();
            final responseBody = await responseJson.stream.bytesToString();
            return jsonDecode(responseBody);
        }
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    }

    //}
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${authtoken ?? ""}');

    return headers;
  }

  /*  Map<String, String> getHeader(Map<String, String> Headers) {
    Map<String, String> headers;
    headers = Headers;
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${authtoken ?? ""}');

    return headers;
  } */

  /* Future<void> checkStatus(response) async {
    if (response == 400) {
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  } */
}
