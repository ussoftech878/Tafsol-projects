import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/pin_code_controller.dart';

class PinCodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodeController>(() => PinCodeController());
  }
}
