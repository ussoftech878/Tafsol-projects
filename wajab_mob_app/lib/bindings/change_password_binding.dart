import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/reset_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}
