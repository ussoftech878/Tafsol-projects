import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/controllers/bot_nav_bar_controller.dart';
import 'package:wajba_mobile_app/controllers/browse_screen_controller.dart';
import 'package:wajba_mobile_app/controllers/favourite_screen_controller.dart';
import 'package:wajba_mobile_app/controllers/home_screen_controller.dart';

class BottomNavBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BotNavBarController>(() => BotNavBarController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<BrowseScreenController>(() => BrowseScreenController());
    Get.lazyPut<FavScreenController>(() => FavScreenController());
    Get.lazyPut<AccountScreenController>(() => AccountScreenController());
  }
}
