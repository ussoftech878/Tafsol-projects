import 'dart:ui';

import 'package:get/get.dart';

class Languagecontroller extends GetxController {
  RxString language = 'en'.obs;
  RxString fontFamily = ''.obs;
  void toggleLanguage() {
    if (language.value == 'en') {
      language.value = 'ar';
      fontFamily.value = "Almarai";
    } else {
      language.value = 'en';
      fontFamily.value = 'SFPRODISPLAYREGULAR';
    }
    Get.updateLocale(Locale(language.value));
  }
}
