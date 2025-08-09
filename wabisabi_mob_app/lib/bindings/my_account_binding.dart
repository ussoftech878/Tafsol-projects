import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAccountController>(() => MyAccountController());
  }
}
