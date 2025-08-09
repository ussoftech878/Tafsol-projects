import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/bindings/bot_nav_bar_binding.dart';
import 'package:wabisabi_mob_app/bindings/chat_bindings.dart';
import 'package:wabisabi_mob_app/bindings/create_agreement_binding.dart';
import 'package:wabisabi_mob_app/bindings/forget_pas_onboard_binding.dart';
import 'package:wabisabi_mob_app/bindings/kyc_binding.dart';
import 'package:wabisabi_mob_app/bindings/otp_binding.dart';
import 'package:wabisabi_mob_app/bindings/pin_code_binding.dart';
import 'package:wabisabi_mob_app/bindings/sign_in_binding.dart';
import 'package:wabisabi_mob_app/bindings/signup_binding.dart';
import 'package:wabisabi_mob_app/bindings/splash_binding.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/KYC_on_boarding.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/banking_information_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/contact_information_screen1.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/contact_information_screen2.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/declaration&confirmation_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/financial_&_proffessional_screen.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/personal_identification_screen1.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/personal_identification_screen2.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/verify_profile_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/forget_pass_onboarding.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/forget_password_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/fp_otp_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/reset_password_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/confirm_pin_code_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/credentials_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/login_with_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/otp_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/set_pin_code_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/sign_up_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/qr_send_money_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/scan_the_qr_code_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/QR_screen/send_money_pincode_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/bot_nav_bar.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/choose_agreement_type.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/create_agreement.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/preview_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/view_participant.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/msg_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/notification_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/select_participants_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/add_new_beneficiary.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/add_new_beneficiary_screen2.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/chatbot_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/home_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/more_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/new_beneficiary_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/quick_pay_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/send_money_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/transactions_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/view_beneficiary_Screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/Terms_&_conditions_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/change_pass_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/faqs_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/privacy_policy_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/profile_screen/profile_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/account_level_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/favorites_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/my_wallet_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/set_trans_limit_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/transaction_history_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/signup_onboarding.dart';
import 'package:wabisabi_mob_app/views/splash_screen.dart';

class Pages {
  static Transition get _routeTransition => Transition.fade;
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
          transition: _routeTransition,
        );
      case SignUpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SignUpScreen(),
          binding: SignUpOnboardingBindings(),
          transition: _routeTransition,
        );

      case LoginWithScreen.routeName:
        return GetPageRoute(
            settings: settings,
            page: () => const LoginWithScreen(),
            transition: _routeTransition);

      case SignUpOnBoarding.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SignUpOnBoarding(),
          binding: SignUpOnboardingBindings(),
          transition: _routeTransition,
        );

      case OtpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => OtpScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );

      // case PhoneNumberScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,

      //     page: () => SignUpScreen(),
      //     transition: _routeTransition,
      //   );

      case CredentialsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CredentialsScreen(),
          // binding: EmailVerificationScreen(),
          transition: _routeTransition,
        );
      case SetPinCodeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          binding: PinCodeBindings(),
          page: () => SetPinCodeScreen(),
          transition: _routeTransition,
        );
      case ConfirmPinCodeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          binding: PinCodeBindings(),
          page: () => const ConfirmPinCodeScreen(),
          transition: _routeTransition,
        );
      case VerifyProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          bindings: [
            KYCBinding(),
          ],
          page: () => VerifyProfileScreen(),
          transition: _routeTransition,
        );
      case KycOnBoarding.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => KycOnBoarding(),
          binding: KYCBinding(),
          transition: _routeTransition,
        );
      case PersonalIdentificationScreen1.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PersonalIdentificationScreen1(),
          transition: _routeTransition,
        );
      case PersonalIdentificationScreen2.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PersonalIdentificationScreen2(),
          transition: _routeTransition,
        );
      case ContactInformationScreen1.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ContactInformationScreen1(),
          transition: _routeTransition,
        );
      case ContactInformationScreen2.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ContactInformationScreen2(),
          transition: _routeTransition,
        );
      case FinancialAndProffessionalInfoScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const FinancialAndProffessionalInfoScreen(),
          transition: _routeTransition,
        );
      case BankingInformationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const BankingInformationScreen(),
          transition: _routeTransition,
        );
      case DeclarationAndconfirmationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const DeclarationAndconfirmationScreen(),
          transition: _routeTransition,
        );
      case SignInScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SignInScreen(),
          binding: SignInBindings(),
          transition: _routeTransition,
        );

      case ForgetPasswordScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ForgetPasswordScreen(),
          transition: _routeTransition,
        );
      case ForgetPassOnboarding.routeName:
        return GetPageRoute(
          settings: settings,
          binding: PorgetPasOnBoardBinding(),
          page: () => const ForgetPassOnboarding(),
          transition: _routeTransition,
        );
      case FpOtpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => FpOtpScreen(),
          transition: _routeTransition,
        );
      case ResetPasswordScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ResetPasswordScreen(),
          transition: _routeTransition,
        );
      case BotNavBar.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const BotNavBar(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case SendMoneyScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SendMoneyScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case AddNewBeneficiary.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AddNewBeneficiary(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case AddNewBeneficiaryScreen2.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AddNewBeneficiaryScreen2(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case NewBeneficiaryScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const NewBeneficiaryScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case QuickPayScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const QuickPayScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case ChatbotScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ChatbotScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case MsgScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MsgScreen(),
          binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const NotificationScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case ScanTheQrCodeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ScanTheQrCodeScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case QrSendMoneyScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const QrSendMoneyScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case SendMoneyPincodeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SendMoneyPincodeScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case AccountLevelScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AccountLevelScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case SetTransLimitScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SetTransLimitScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case TransactionHistoryScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const TransactionHistoryScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case MyWalletScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MyWalletScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );

      case FavoritesScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const FavoritesScreen(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );

      case HomeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case ViewParticipant.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ViewParticipant(),
          // binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case SelectParticipantsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SelectParticipantsScreen(),
          binding: ChatBindings(),
          transition: _routeTransition,
        );
      case ChooseAgreementType.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ChooseAgreementType(),
          binding: ChatBindings(),
          transition: _routeTransition,
        );
      case CreateAgreement.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => CreateAgreement(),
          binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case PreviewScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PreviewScreen(),
          binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case ChangePassScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ChangePassScreen(),
          // binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case PrivacyPolicyScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const PrivacyPolicyScreen(),
          // binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case TermsConditionScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const TermsConditionScreen(),
          // binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case FAQsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const FAQsScreen(),
          // binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case MoreScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MoreScreen(),
          // binding: CreateAgreementBinding(),
          transition: _routeTransition,
        );
      case ViewBeneficiaryScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ViewBeneficiaryScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case TransactionsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const TransactionsScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      case ProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ProfileScreen(),
          binding: BottomNavBarBindings(),
          transition: _routeTransition,
        );
      default:
        return null;
    }
  }
}
