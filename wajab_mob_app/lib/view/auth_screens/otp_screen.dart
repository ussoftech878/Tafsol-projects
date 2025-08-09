import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/otp_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/change_password_screen.dart';
import 'package:wajba_mobile_app/view/auth_screens/sign_up_form_screen.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

import '../../widgets/custom_back_button_app_bar.dart';

class OtpScreen extends GetView<OtpController> {
  static const routeName = 'OtpScreen';

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Verify Phone'.tr,
        actionsButton: [
          Padding(
              padding:  EdgeInsetsDirectional.only(end: 27.w),
              child: LanguageButton())
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 25.h, bottom: 27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                  textAlign: TextAlign.center,
                  'You will receive an SMS with the one-time password (OTP) needed to verify your number.'
                      .tr,
                  style: TextStyle(
                      color: const Color(0xff252525).withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontSize: 14.sp)),
            ),
            SizedBox(
              height: 36.h,
            ),
            Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 6, // Number of OTP fields
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the code'.tr;
                } else if (value.length < 6) {
                  return 'Code must be 6 digits'.tr;
                }
                return null;
              },
              defaultPinTheme: PinTheme(
                width: 51.w,
                height: 64.h,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 48),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color(0xffE2E5E8)), // Default grey
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 51.w,
                height: 64.h,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 48),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: AppColors.forestColor,
                      width: 1.5), // Green for focus
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 51.w,
                height: 64.h,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 48),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: AppColors.forestColor,
                      width: 1.5), // Green for submitted
                ),
              ),
              showCursor: false,
              onChanged: (value) {
                // Update the OTP value dynamically
                controller.otp.value = value;

                // Validate the form and update the isEnabled status
                if (formKey.currentState!.validate()) {
                  controller.isEnabled.value = true;
                } else {
                  controller.isEnabled.value = false;
                }
              },
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (Get.arguments ?? false) {
                      Get.toNamed(ChangePasswordScreen.routeName);
                    } else {
                      Get.toNamed(SignUpFormScreen.routeName);
                    }
                  },
                  child: Text('Continue'.tr)),
            ),
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Resend Code 59s'.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff252525).withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
