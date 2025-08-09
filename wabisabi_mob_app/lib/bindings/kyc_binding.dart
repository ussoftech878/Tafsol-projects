import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/KYC_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/controllers/signin_onboarding_controller.dart';

class KYCBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KycOnBoardingController>(KycOnBoardingController(),
        permanent: true);
  }
}
