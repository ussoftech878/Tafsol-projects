// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/bindings/bot_nav_bar_binding.dart';
import 'package:wajba_mobile_app/bindings/change_password_binding.dart';
import 'package:wajba_mobile_app/bindings/home_screen_binding.dart';
import 'package:wajba_mobile_app/bindings/onboarding_bindings.dart';
import 'package:wajba_mobile_app/bindings/otp_binding.dart';
import 'package:wajba_mobile_app/bindings/signup_form_binding.dart';
import 'package:wajba_mobile_app/view/allow_notification_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/change_password_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/email_verification_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/login_with_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/otp_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/password_verification.dart';
import 'package:wajba_mobile_app/view/auth_screens/reset_password.dart';
import 'package:wajba_mobile_app/view/auth_screens/sign_up_form_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/sign_up_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/FAQs/FAQs_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_details/account_detail_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/co2avoided_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_details/edit_profile_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/money_saved_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/my_orders_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/order_details_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/my_orders/your_order_cancel_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/card_Selection_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/order_confirmation_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/payment_methods/thankyou_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/support/support_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/terms_conditions/terms_conditions_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/vouchers/vouchers_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/bot_nav_bar.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/browse_screen/browse_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/favorites_screen/favorites_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/close_to_you_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/home_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/location_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/wallet_screens/my_cards_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/notification_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/wallet_screens/wallet_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/wallet_screens/wallet_transactions_screen.dart';
import 'package:wajba_mobile_app/view/location_screen.dart';
import 'package:wajba_mobile_app/view/on_boarding_screens/onboarding_screen.dart';
import 'package:wajba_mobile_app/view/splash_screen.dart';

class Pages {
  static Transition get _routeTransition => Transition.fade;
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case OnboardingScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OnboardingScreen(),
          binding: OnboardingBinding(),
          transition: _routeTransition,
        );

      case LoginWithScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const LoginWithScreen(),
            transition: _routeTransition);

      case LocationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const LocationScreen(),
          transition: _routeTransition,
        );

      case AllowNotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AllowNotificationScreen(),
          transition: _routeTransition,
        );

      case SignUpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SignUpScreen(),
          transition: Transition.rightToLeft,
        );

      case EmailVerificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const EmailVerificationScreen(),
          // binding: EmailVerificationScreen(),
          transition: _routeTransition,
        );
      case SignUpFormScreen.routeName:
        return GetPageRoute(
          settings: settings,
          binding: SignUpFormBinding(),
          page: () => const SignUpFormScreen(),
          transition: _routeTransition,
        );
      case SplashScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SplashScreen(),
          transition: _routeTransition,
        );
      case ResetPassword.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ResetPassword(),
          binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case PasswordVerification.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PasswordVerification(),
          transition: _routeTransition,
        );
      case ChangePasswordScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ChangePasswordScreen(),
          binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case BotNavBar.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => BotNavBar(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case HomeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          binding: HomeScreenBinding(),
          transition: _routeTransition,
        );
      case BrowseScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const BrowseScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case FavoritesScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const FavoritesScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case AccountScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => AccountScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case OtpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () {
            return const OtpScreen();
          },
          binding: OtpBinding(),
          transition: _routeTransition,
        );
      case CloseToYouScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CloseToYouScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const NotificationScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case WalletScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const WalletScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case MyCardsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MyCardsScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case WalletTransactionsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const WalletTransactionsScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case AccountDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountDetailScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case EditProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const EditProfileScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case CO2AvoidedScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CO2AvoidedScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case MoneySavedScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MoneySavedScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case MyOrdersScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MyOrdersScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case YourOrderCancelScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const YourOrderCancelScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case OrderDetailsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OrderDetailsScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case CardSelectionScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CardSelectionScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case VouchersScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const VouchersScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case FAQsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const FAQsScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case SupportScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SupportScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case TermsConditionsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const TermsConditionsScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case MapLocationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MapLocationScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case OrderConfirmationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OrderConfirmationScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );
      case ThankyouScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ThankyouScreen(),
          // binding: ChangePasswordBinding(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
