import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/view/auth_screens/organizations_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/Institutions_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/corporate_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_general_sc.dart';
import 'package:wazefni_iraq/view/auth_screens/otp_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/Institution_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/corporate_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/employer_email_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/employer_phone_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/employer_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/organization_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/phone_info_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/sign_in/forget_pass_otp.dart';
import 'package:wazefni_iraq/view/auth_screens/sign_in/set_a_new_pass.dart';
import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/welcome_employer_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/welcome_screen.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_page4.dart';
import 'package:wazefni_iraq/view/on_boarding_screens/onboarding_screen.dart';

//all the route of the screens are defined here
import 'package:wazefni_iraq/view/splash.dart';

import '../view/auth_screens/sign_in/forget_pass_phone_otp.dart';

class Pages {
  static Transition get _routeTransition => Transition.leftToRight;
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case OnboardingScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => OnboardingScreen(),
          // binding: SplashBinding(),
          transition: _routeTransition,
        );
      case OrganizationsEmailInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OrganizationsEmailInfoScreen(),
          // binding: SplashBinding(),
          transition: _routeTransition,
        );
      case InstitutionsEmailInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const InstitutionsEmailInfoScreen(),
          // binding: SplashBinding(),
          transition: _routeTransition,
        );
      case CorporateEmailInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CorporateEmailInfoScreen(),
          // binding: SplashBinding(),
          transition: _routeTransition,
        );
      case ForgetPassPhoneOtp.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ForgetPassPhoneOtp(),
          // binding: SplashBinding(),
          transition: _routeTransition,
        );
      case OnboardingPage4.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const OnboardingPage4(),
            transition: _routeTransition);
      case OrganizationSignupScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const OrganizationSignupScreen(),
            transition: _routeTransition);
      case InstitutionSignupScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const InstitutionSignupScreen(),
            transition: _routeTransition);
      case CorporateSignupScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const CorporateSignupScreen(),
            transition: _routeTransition);
      case Splash.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const Splash(),
            transition: _routeTransition);
      case EmailInfoScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => EmailInfoScreen(),
            transition: _routeTransition);
      case OtpScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => OtpScreen(routeToGo: settings.arguments as String),
            transition: _routeTransition);
      case SigninScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const SigninScreen(),
            transition: _routeTransition);

      case Otp_General_Sc.routeName:
        final arguments = settings.arguments as Map<String, String>;
        return GetPageRoute(
            settings: settings,
            page: () => Otp_General_Sc(
                  routeToGo: arguments['routeToGo']!,
                  Title: arguments['Title']!,
                  SubTitle: arguments['SubTitle']!,
                  subtext: arguments['subtext']!,
                  editText: arguments['editText']!,
                ),
            transition: _routeTransition);
      case WelcomeEmployerScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const WelcomeEmployerScreen(),
            transition: _routeTransition);
      case EmployerSignupScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const EmployerSignupScreen(),
            transition: _routeTransition);
      case SignupScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const SignupScreen(),
            transition: _routeTransition);
      case WelcomeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const WelcomeScreen(),
          transition: _routeTransition,
        );

      case PhoneInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PhoneInfoScreen(),
          transition: _routeTransition,
        );

      case EmployerEmailInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const EmployerEmailInfoScreen(),
          transition: _routeTransition,
        );

      case EmployerPhoneInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const EmployerPhoneInfoScreen(),
          transition: _routeTransition,
        );

      case ForgetPassOtp.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ForgetPassOtp(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );

      case SetANewPass.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SetANewPass(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
