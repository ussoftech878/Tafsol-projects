import 'package:get/get.dart';
import 'package:wabisabi_mob_app/widgets/custom_success_dialog.dart';

class DialogUtils {
  static void showPasswordResetSuccessDialog() {
    Get.dialog(
      CustomSuccessDialog(
        title: 'Password Updated',
        message: 'Now you can pay for bill and transfer conveniently',
        buttonText: 'Proceed To App',
        onButtonPressed: () {
          Get.back(); // Close dialog
          // Navigate to main app screen or login
          // Get.offAllNamed(YourMainScreen.routeName);
        },
      ),
      barrierDismissible: false,
    );
  }
} 