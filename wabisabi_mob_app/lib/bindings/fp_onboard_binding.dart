import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';

class FpOnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasOnBoardingController>(
        () => ForgetPasOnBoardingController());
  }
}
