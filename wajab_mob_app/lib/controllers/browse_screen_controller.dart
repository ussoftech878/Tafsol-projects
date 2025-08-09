import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class BrowseScreenController extends GetxController {
  var isListView =
      true.obs; // Tracks whether the current view is the map or list
  var searchController = TextEditingController().obs;

  void toggleView() {
    isListView.value = !isListView.value;
  }

  @override
  void onClose() {
    searchController.value.dispose();
    super.onClose();
  }

  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
}
