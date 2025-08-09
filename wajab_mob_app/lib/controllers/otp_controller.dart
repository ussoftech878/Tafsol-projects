import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class OtpController extends GetxController {
  var otp = ''.obs;
  // var isOtpValid = false.obs;
  RxBool isEnabled = false.obs;

  // void onOtpChanged(String value) {
  //   otp.value = value;
  //   if (otp.value.length == 6) {
  //     isOtpValid.value = true;
  //   } else {
  //     isOtpValid.value = false;
  //   }
  // }
  Languagecontroller languagecontroller = Get.find<Languagecontroller>();
}
