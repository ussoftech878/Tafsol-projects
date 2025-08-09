import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/Signup_form_controller.dart.dart';

class SignUpFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpFormController>(() => SignUpFormController());
  }
}
