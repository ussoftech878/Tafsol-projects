import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/pin_code_controller.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/pin_set.dart';

class ConfirmPinCodeScreen extends GetView<PinCodeController> {
  static const routeName = 'ConfirmPinCodeScreen';
  const ConfirmPinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text('Hi John Doe',
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp)),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Confirm Your Pin',
                        style: TextStyle(fontSize: 16.sp))),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Confirm a secure PIN to protect your transactions',
                        style: TextStyle(fontSize: 12.sp))),
                SizedBox(
                  height: 27.h,
                ),
                Pinput(
                  mainAxisAlignment: MainAxisAlignment.center,
                  length: 5, // Number of OTP fields
                  obscureText: true,
                  obscuringWidget: Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.isConfirmPincodeValid.value = false;
                      return 'OTP cannot be empty';
                    }

                    controller.isConfirmPincodeValid.value = true;
                    return null;
                  },
                  defaultPinTheme: PinTheme(
                    width: 20.w,
                    height: 20.h,
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black, fontSize: 12),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 223, 218),
                      shape: BoxShape.circle,
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    width: 20.w,
                    height: 20.h,
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black, fontSize: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xffFD2727),
                      shape: BoxShape.circle,
                    ),
                  ),

                  showCursor: false,
                  onChanged: (value) {
                    controller.setConfirmPinCode(value);
                    if (kDebugMode) {
                      print("Entered PIN: $value");
                    }
                  },
                ),
                Obx(() => Visibility(
                      visible: controller.errorMessage.value.isNotEmpty,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          controller.errorMessage.value,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    )),
                const Spacer(),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        backgroundColor: controller.isConfirmPincodeValid.value
                            ? AppColors.kPrimaryColor
                            : Color(0xffE3E5E5),
                        foregroundColor: controller.isConfirmPincodeValid.value
                            ? Colors.white
                            : Color(0xff979C9E),
                        elevation: 0,
                      ),
                      onPressed: () {
                        controller
                            .validateConfirmPinCode(); // Validate on submit
                        if (controller.errorMessage.value.isEmpty) {
                          final signUpController =
                              Get.find<SignUpOnboardingController>();
                          controller
                              .setIdPin(
                                  signUpController.wabisabiIdController.text)
                              .then((value) {
                            if (value) {
                              showPinSetDialogBox(context);
                            }
                          });
                        }
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
