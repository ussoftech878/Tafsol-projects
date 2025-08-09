import 'dart:ui';

import 'package:get/get.dart';

class Languagecontroller extends GetxController {
  RxString language = 'en'.obs;
  RxString fontFamily = 'GeneralSans'.obs;
  RxInt int = 45.obs;

  void toggleLanguage() {
    if (language.value == 'en') {
      language.value = 'ar';
      fontFamily.value = "Tajawal";
    } else {
      language.value = 'en';
      fontFamily.value = 'GeneralSans';
    }
    Get.updateLocale(Locale(language.value));
  }
}
