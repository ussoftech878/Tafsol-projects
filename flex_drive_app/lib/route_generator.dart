import 'package:flexdrive/screens/reset_password_screen.dart';
import 'package:flexdrive/screens/Splash_screen.dart';
import 'package:flexdrive/screens/bottom_nav_bar_screen.dart';
import 'package:flexdrive/screens/card_management_screen.dart';
import 'package:flexdrive/screens/forgot_password_screen.dart';
import 'package:flexdrive/screens/home_detail_screen.dart';
import 'package:flexdrive/screens/home_screen.dart';
import 'package:flexdrive/screens/login_screen.dart';
import 'package:flexdrive/screens/otp_screen.dart';
import 'package:flexdrive/screens/password_changed_screen.dart';
import 'package:flexdrive/screens/profile_screen.dart';
import 'package:flexdrive/screens/change_password_screen.dart';
import 'package:flutter/material.dart';

const String splashRoute = '/';
const String loginRoute = '/login';
const String forgotPasswordRoute = '/forgot_password';
const String otpRoute = '/otp';
const String passwordChangedRoute = '/password_changed';
const String homeDetailRoute = '/home_detail';
const String homeScreenRoute = '/home';
const String cardManagementRoute = '/card_management';
const String profileRoute = '/profile';
const String resetPasswordRoute = '/reset_password';
const String navBarRoute = '/nav_bar';
const String updatePasswordRoute = "/update_password";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) =>const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) =>const LoginScreen());
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) =>const ForgotPasswordScreen());
      case otpRoute:
        return MaterialPageRoute(builder: (_) =>const OtpScreen());
      case passwordChangedRoute:
        return MaterialPageRoute(builder: (_) =>const PasswordChangedScreen());
      case homeDetailRoute:
        return MaterialPageRoute(builder: (_) =>const HomeDetailScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) =>const HomeScreen());
      case cardManagementRoute:
        return MaterialPageRoute(builder: (_) =>const CardManagementScreen());
      case profileRoute:
        return MaterialPageRoute(builder: (_) =>const ProfileScreen());
      case resetPasswordRoute:
        return MaterialPageRoute(builder: (_) =>const ResetPasswordScreen());
      case navBarRoute:
        return MaterialPageRoute(builder: (_) =>const BottomNavBarScreen());
      case updatePasswordRoute:
        return MaterialPageRoute(builder: (_) =>const ChangePasswordScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title:const Text('Error'),
        ),
        body:const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
