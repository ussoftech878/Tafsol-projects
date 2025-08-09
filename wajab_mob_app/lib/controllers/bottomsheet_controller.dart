import 'package:get/get.dart';

class BottomsheetController extends GetxController {
  //deduct from waller bottomsheet
  RxBool isFullAmountSelected = true.obs;

  void selectFullAmount() {
    isFullAmountSelected.value = true;
  }

  void selectCustom() {
    isFullAmountSelected.value = false;
  }
}
