import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wajba_mobile_app/controllers/ccp_controller.dart';
import 'package:wajba_mobile_app/controllers/language_controller.dart';

class AccountScreenController extends GetxController {
  Languagecontroller languagecontroller = Get.find<Languagecontroller>();

  final FocusNode focusNode = FocusNode();
  RxBool isFocused = false.obs; // Observable to track focus state

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedImagePath = ''.obs; // Observable for the selected image path
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedImagePath.value = image.path;
      } else {
        // Get.snackbar("No Image Selected", "Please select an image.");
      }
    } catch (e) {
      // Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Listen to the focus changes
    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    focusNode.dispose(); // Dispose of the FocusNode to avoid memory leaks
    super.onClose();
  }

  CcpController ccpController = Get.put(CcpController());
}
