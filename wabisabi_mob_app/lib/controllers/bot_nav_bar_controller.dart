import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/models/response/user_details_response.dart';
import 'package:wabisabi_mob_app/services/user_services.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/chat_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/chat_screen/view_participant.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/home_screen/home_screen.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/wallet_screen/wallet_screen.dart';

class BotNavBarController extends GetxController {
  UserServices _userServices = UserServices();
  Rx<UserDetailsResponse> _userDetailsResponse = UserDetailsResponse().obs;

  // Getter and setter
  void setuserDetails(UserDetailsResponse userDetailsResponse) {
    _userDetailsResponse.value = userDetailsResponse;
  }

  UserDetailsResponse get userDetailsResponse => _userDetailsResponse.value;

  @override
  void onInit() {
    GetUserDetails();
    super.onInit();
  }

  //APi calling
  Future<bool> GetUserDetails() async {
    EasyLoading.show(status: 'loading...');
    try {
      final response = await _userServices.getuserDetails();

      if (response.isSuccess!) {
        setuserDetails(response);
        debugPrint(response.message.toString());
        return true;
      } else {
        EasyLoading.showError(response.message.toString());
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  // Tracks the current page index
  var currentIndex = 0.obs;

  // List of pages to navigate
  final pages = [
    const HomeScreen(),
    const WalletScreen(),
    const ChatScreen(),
    const ViewParticipant(),
  ];

  // Method to change page
  void changePage(int index) {
    currentIndex.value = index;
  }
}
