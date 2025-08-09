import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/bot_nav_bar_controller.dart';
import 'package:wabisabi_mob_app/controllers/home_controller.dart';
import 'package:wabisabi_mob_app/controllers/my_Account_controller.dart';

class BottomNavBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BotNavBarController>(() => BotNavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyAccountController>(() => MyAccountController());
  }
}
