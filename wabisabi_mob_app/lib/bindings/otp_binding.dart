import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/otp_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
