import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors_constants.dart';
import '../../../constants/constants.dart';
import '../../../controllers/LanguageController.dart';
import '../../../controllers/SignIn_controller.dart';
import '../../../widgets/custom_app_bar.dart';
import 'set_a_new_pass.dart';

class ForgetPassOtp extends StatelessWidget {
  static const routeName = 'ForgetPassOtp';
  ForgetPassOtp({super.key});
  Languagecontroller lang_controller = Get.put(Languagecontroller());
  SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: MyAppBar(title: '', onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Password Recovery'.tr,
              style: TextStyle(
                  color: const Color(0xff141414),
                  fontWeight: FontWeight.w700,
                  fontFamily: lang_controller.fontFamily.value,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Enter the confirmation code sent via email to '.tr,
              style: TextStyle(
                color: AppColors.greyColor,
                fontFamily: lang_controller.fontFamily.value,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            Text('example@email.com',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: lang_controller.fontFamily.value,
                    fontSize: 12.sp)),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgAssets.Icon_Leading,
                  width: 16.w,
                  height: 16.h,
                ),
                k2wSizedBox,
                Text('Edit Email'.tr,
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: lang_controller.fontFamily.value,
                        fontSize: 12.sp)),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: Obx(() {
                  // Get OTP value from controller (using Rx<String>)
                  String otpValue = controller.otpController.value;
                  Color borderColor;
                  Color fillColor;

                  // Update colors based on OTP length
                  if (otpValue.isNotEmpty && otpValue.length < 4) {
                    borderColor = Colors.red;
                    fillColor = const Color(0xffFEE5E5); // Light red
                  } else if (otpValue.length == 4) {
                    borderColor = Colors.green;
                    fillColor = const Color(0xffE8F8E8); // Light green
                  } else {
                    borderColor = const Color(0xffADADAD); // Default grey
                    fillColor = const Color(0xffF5F5F5); // Default light grey
                  }

                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      // controller: controller.otpController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      length: 4, // Number of OTP fields
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the code'.tr;
                        } else if (value.length < 4) {
                          return 'Code must be 4 digits'.tr;
                        }
                        return null;
                      },
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                ),
                        decoration: BoxDecoration(
                          color: fillColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: borderColor),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                ),
                        decoration: BoxDecoration(
                          color: fillColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: borderColor),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.black,
                                ),
                        decoration: BoxDecoration(
                          color: fillColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: borderColor),
                        ),
                      ),
                      showCursor: false,
                      onChanged: (value) {
                        // Update the OTP value dynamically
                        controller.otpController.value = value;

                        // Validate the form and update the isEnabled status
                        if (_formKey.currentState!.validate()) {
                          controller.isEnabled.value = true;
                        } else {
                          controller.isEnabled.value = false;
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'You will receive the code within'.tr,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontFamily: lang_controller.fontFamily.value,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  children: [
                    TextSpan(
                        text: ' 00:18 ',
                        style: TextStyle(
                            color: AppColors.orangeColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: lang_controller.fontFamily.value,
                            fontSize: 12.sp)),
                    TextSpan(
                      text: 'seconds'.tr,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontFamily: lang_controller.fontFamily.value,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 80.h,
            ),
            Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.isEnabled.value
                          ? Get.toNamed(SetANewPass.routeName)
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.isEnabled.value ? null : Color(0xffFFD8BF),
                    ),
                    child: Text(
                      'Continue'.tr,
                      style: TextStyle(
                        fontFamily: lang_controller.fontFamily.value,
                      ),
                    ))))
          ],
        ),
      ),
    );
  }
}
