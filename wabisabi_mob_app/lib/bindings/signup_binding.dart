import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';

class SignUpOnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpOnboardingController>(() => SignUpOnboardingController());
  }
}
