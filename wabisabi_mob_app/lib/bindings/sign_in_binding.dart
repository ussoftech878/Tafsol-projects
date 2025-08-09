import 'package:get/get.dart';

import '../controllers/signin_onboarding_controller.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}
