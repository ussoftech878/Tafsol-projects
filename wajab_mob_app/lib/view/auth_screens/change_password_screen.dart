import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/controllers/reset_password_controller.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';
import 'package:wajba_mobile_app/widgets/show_dialog_box.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';

import '../../widgets/custom_back_button_app_bar.dart';

class ChangePasswordScreen extends GetView<ResetPasswordController> {
  static const routeName = 'ChangePasswordScreen';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(
        title: 'Change Password'.tr,
        actionsButton: [
          Padding(
              padding: EdgeInsetsDirectional.only(end: 27.w),
              child: LanguageButton())
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, top: 27.h, bottom: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                'Enter your new password below to complete the password reset process.'
                    .tr,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kTextGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: controller.languagecontroller.fontFamily.value),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              'Password'.tr,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.kTextGreyColor,
                  fontSize: 14,
                  fontFamily: controller.languagecontroller.fontFamily.value),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => TextField(
                obscureText: !controller.isPasswordVisible.value,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.5.h),
                  hintText: 'Password'.tr,
                  // hintStyle: TextStyle(
                  //     fontSize: 28.sp,
                  //     fontWeight: FontWeight.w500,
                  //     fontFamily: languagecontroller.fontFamily.value,,
                  //     color: const Color(0xff252525)),
                  prefixIcon: SvgPicture.asset(
                    svgAssets.lock,
                    fit: BoxFit.scaleDown,
                    width: 24.w,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                    icon: controller.isPasswordVisible.value
                        ? SvgPicture.asset(
                            svgAssets.eye,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          )
                        : SvgPicture.asset(
                            svgAssets.eyeSlash,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              'Confirm Password'.tr,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.kTextGreyColor,
                  fontFamily: controller.languagecontroller.fontFamily.value),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => TextField(
                obscureText: !controller.isConfirmPasswordVisible.value,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.5.h),
                  hintText: 'Password'.tr,
                  // hintStyle: TextStyle(
                  //     fontSize: 28.sp,
                  //     fontWeight: FontWeight.w500,
                  //     fontFamily: languagecontroller.fontFamily.value,,
                  //     color: const Color(0xff252525)),
                  prefixIcon: SvgPicture.asset(
                    svgAssets.lock,
                    fit: BoxFit.scaleDown,
                    width: 24.w,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isConfirmPasswordVisible.value =
                          !controller.isConfirmPasswordVisible.value;
                    },
                    icon: controller.isConfirmPasswordVisible.value
                        ? SvgPicture.asset(
                            svgAssets.eye,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          )
                        : SvgPicture.asset(
                            svgAssets.eyeSlash,
                            fit: BoxFit.scaleDown,
                            width: 24.w,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(PasswordVerification.routeName);
                    showLocationDialogBox(context);
                  },
                  child: Text('Change Password'.tr)),
            )
          ],
        ),
      ),
    );
  }
}
