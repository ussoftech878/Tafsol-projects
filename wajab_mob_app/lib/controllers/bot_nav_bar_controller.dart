import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/browse_screen/browse_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/favorites_screen/favorites_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/home_screen/home_screen.dart';

class BotNavBarController extends GetxController {
  // Tracks the current page index
  var currentIndex = 0.obs;

  RxBool vissible = true.obs;

  // List of pages to navigate
  final pages = [
    const HomeScreen(),
    const BrowseScreen(),
    const FavoritesScreen(),
     AccountScreen(),
    // const WalletScreen(),
  ];

  // Method to change page
  void changePage(int index) {
    currentIndex.value = index;
  }

  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
}
