import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';

class PorgetPasOnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgetPasOnBoardingController>(ForgetPasOnBoardingController());
  }
}
