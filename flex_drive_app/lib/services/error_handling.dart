import 'package:flexdrive/main.dart';
import 'package:flexdrive/route_generator.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class ErrorHandling {
  errorHandling({required int responseCode}) {
    switch (responseCode) {
      case 400:
        Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!,
          loginRoute,
          (Route<dynamic> route) => false,
        );
        case 401:
        Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!,
          loginRoute,
          (Route<dynamic> route) => false,
        );
    }
  }
}
