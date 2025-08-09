import 'dart:async';
import 'package:flexdrive/route_generator.dart';
import 'package:flexdrive/utills/Colored_print.dart';
import 'package:flexdrive/utills/enums.dart';
import 'package:flexdrive/utills/shared_pref.dart';
import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  SplashProvider() {}
 SharedPref _sharedPref = SharedPref();

  void startSplashTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      var token;
      token = await _sharedPref.read(Shared_pref_enum.authToken.value);

      _navigateToLogin(context, token);
    });
  }

  void _navigateToLogin(BuildContext context, var token) {
    // Notify listeners to navigate to the login screen

    Navigator.pushReplacementNamed(
      context,
      token == null ? loginRoute : navBarRoute,
    );
    notifyListeners();
  }
}
