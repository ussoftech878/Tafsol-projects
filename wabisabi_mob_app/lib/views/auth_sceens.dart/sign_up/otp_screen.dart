import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/otp_controller.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';

// ignore: must_be_immutable
class OtpScreen extends GetView<OtpController> {
  @override
  OtpController controller = Get.put(OtpController());
  static const routeName = 'OtpScreen';
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 24.h),
                  Text('Enter OTP',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp)),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 58.w),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Enter the OTP code we just sent you on your registered Email',
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                  SizedBox(height: 42.h),
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    controller: controller.otpController,
                    length: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isOtpValid.value = false;
                        return 'OTP cannot be empty';
                      }
                      controller.isOtpValid.value = true;
                      return null;
                    },
                    onCompleted: (value) {
                      if (controller.isOtpValid.value) {
                        if (kDebugMode) {
                          print('OTP entered: $value');
                        }
                      }
                    },
                    onChanged: (value) {
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
                  Spacer(),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Column(
                      children: [
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
                                    ? () async {
                                        final signUpController = Get.find<
                                            SignUpOnboardingController>();
                                        final otpVerified = await controller
                                            .verifyotp(signUpController
                                                .emailController.text);

                                        if (otpVerified) {
                                          signUpController
                                              .signup()
                                              .then((value) {
                                            if (value) {
                                              signUpController.nextPage();
                                            }
                                          });
                                        } // Get.toNamed('/next-screen');
                                      }
                                    : null,
                                child: const Text('Verify'),
                              )),
                        ),
                        SizedBox(height: 16.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'Didn\'t get OTP? ',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color)),
                                  children: [
                                    TextSpan(
                                      text: controller.isResendEnabled.value
                                          ? 'Resend OTP'
                                          : 'Resend OTP in ${controller.formattedTime}',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.kPrimaryColor)),
                                      recognizer:
                                          controller.isResendEnabled.value
                                              ? (TapGestureRecognizer()
                                                ..onTap = () {
                                                  final signUpController = Get.find<
                                                      SignUpOnboardingController>();

                                                  controller.resendOtp(
                                                      signUpController
                                                          .emailController
                                                          .text);
                                                })
                                              : null,
                                    )
                                  ]))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
