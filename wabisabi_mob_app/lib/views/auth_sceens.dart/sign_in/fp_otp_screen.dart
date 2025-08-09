import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';

class FpOtpScreen extends GetView<ForgetPasOnBoardingController> {
  static const routeName = 'FpOtpScreen';
  const FpOtpScreen({super.key});
  // OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // Start timer when screen is built
    controller.startOtpTimer();

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25.h),
                  Text(
                    'Enter OTP',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.sp),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Enter the OTP code we just sent you on your registered Email/Phone number',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Color(0xff61677D),
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                  SizedBox(height: 42.h),
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    controller: controller.otpController,
                    length: 4, // Number of OTP fields
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isOtpValid.value = false;
                        return 'OTP cannot be empty';
                      }
                      // If OTP is valid
                      controller.isOtpValid.value = true;
                      return null;
                    },

                    onCompleted: (value) {
                      if (controller.isOtpValid.value) {
                        // Proceed with OTP submission
                        // You can call your OTP verification API or any further actions
                        if (kDebugMode) {
                          print('OTP entered: $value');
                        }
                      }
                    },
                    onChanged: (value) {
                      // Optional: Update validity on each change (not always needed)
                      if (value.isEmpty || value.length < 4) {
                        controller.isOtpValid.value = false;
                      } else {
                        controller.isOtpValid.value = true;
                      }
                    },
                    defaultPinTheme: PinTheme(
                      width: 70.w,
                      height: 70.w,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F9FE),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffB3B3B3)),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 70.w,
                      height: 70.w,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF3EE),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.kPrimaryColor, width: 1),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 70.w,
                      height: 70.w,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                              ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF3EE),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.kPrimaryColor, width: 1),
                      ),
                    ),
                    showCursor: false,
                  ),
                  const Spacer(),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Obx(
                              () => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 18.h),
                                  textStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  backgroundColor: controller.isOtpValid.value
                                      ? AppColors.kPrimaryColor
                                      : Color(0xffE3E5E5),
                                  foregroundColor: controller.isOtpValid.value
                                      ? Colors.white
                                      : Color(0xff979C9E),
                                  elevation: 0,
                                ),
                                onPressed: controller.isOtpValid.value
                                    ? () {
                                        if (_formKey.currentState!.validate()) {
                                          controller.nextPage();
                                          /* controller.verifyOtp().then((value) {
                                            if (value) {
                                              controller.nextPage();
                                            }
                                          }); */
                                        }
                                      }
                                    : null,
                                child: const Text('Reset Password'),
                              ),
                            )),
                        SizedBox(height: 16.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'Didn\'t get OTP? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                  children: [
                                    TextSpan(
                                      text: controller.isResendEnabled.value
                                          ? 'Resend OTP'
                                          : 'Resend OTP in ${controller.timer.value}s',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14.sp,
                                              color: controller
                                                      .isResendEnabled.value
                                                  ? AppColors.kPrimaryColor
                                                  : Colors.grey,
                                              fontWeight: FontWeight.normal),
                                      recognizer: controller
                                              .isResendEnabled.value
                                          ? (TapGestureRecognizer()
                                            ..onTap =
                                                () => controller.resendOtp())
                                          : null,
                                    )
                                  ]))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
