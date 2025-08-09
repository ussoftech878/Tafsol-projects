import 'package:get/get.dart';
class VoucherController extends GetxController {
  var selectedVoucher = ''.obs; // Observable to store the selected voucher text
  var discountAmount = 0.0.obs; // Observable to store the discount amount

  // Method to update the selected voucher
  void selectVoucher(String voucher) {
    selectedVoucher.value = voucher;
    // You can update the discountAmount here based on the voucher
    discountAmount.value =
        0.21; // Example of how you can set the discount based on the voucher
  }
}
