// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/Signup_form_controller.dart.dart';
import 'package:wajba_mobile_app/view/on_boarding_screens/onboarding_screen.dart';
import 'package:wajba_mobile_app/widgets/language_button.dart';

import '../../utils/arabic_formator.dart';
import '../../utils/english_formator.dart';
import '../../widgets/custom_back_button_app_bar.dart';
import '../../widgets/gender_container.dart';

// ignore: must_be_immutable
class SignUpFormScreen extends GetView<SignUpFormController> {
  static const routeName = 'SignUpFormScreen';
  const SignUpFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBackButtonAppBar(
          title: 'Enter Your Details'.tr,
          actionsButton: [
            Padding(
                padding: EdgeInsetsDirectional.only(end: 27.w),
                child: LanguageButton())
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 27.w, right: 27.w),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text('First Name'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    inputFormatters:  controller.languagecontroller.language.value == 'ar'
                      ?[ArabicInputFormatter()]: [EnglishInputFormatter()],
                    decoration: InputDecoration(
                      hintText: 'Enter your first name'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Last Name'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your last name'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Gender'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: GenderContainer(
                            text: 'Male'.tr,
                            icon: SvgPicture.asset(
                              svgAssets.male,
                              width: 16.w,
                              color: controller.selectedGender.value == 'Male'
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kTextGreyColor,
                            ),
                            isSelected:
                                controller.selectedGender.value == 'Male',
                            onTap: () => controller.setSelectedGender('Male'),
                            color: controller.selectedGender.value == 'Male'
                                ? AppColors.kPrimaryColor
                                : AppColors.kTextGreyColor,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: GenderContainer(
                            text: 'Female'.tr,
                            icon: SvgPicture.asset(
                              svgAssets.female,
                              color: controller.selectedGender.value == 'Female'
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kTextGreyColor,
                            ),
                            isSelected:
                                controller.selectedGender.value == 'Female',
                            onTap: () => controller.setSelectedGender('Female'),
                            color: controller.selectedGender.value == 'Female'
                                ? AppColors.kPrimaryColor
                                : AppColors.kTextGreyColor,
                            fontFamily:
                                controller.languagecontroller.fontFamily.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Email (Optional)'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    scrollPadding: EdgeInsets.only(bottom: 35.0.h),
                    decoration: InputDecoration(
                      hintText: 'someone@gmail.com'.tr,
                      prefixIcon: SvgPicture.asset(
                        svgAssets.sms,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('Password'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => TextFormField(
                      // textAlignVertical: TextAlignVertical.center,
                      obscureText: !controller.isPasswordVisible.value,
                      scrollPadding: EdgeInsets.only(bottom: 35.0.h),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 15.5.h),
                        hintText: 'Password'.tr,
                        // hintStyle: TextStyle(
                        //     fontSize: 25.sp,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: languagecontroller.fontFamily.value,,
                        //     color: const Color(0xff252525)),
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
                    height: 20.h,
                  ),
                  Text('Confirm Password'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff868787),
                        fontFamily:
                            controller.languagecontroller.fontFamily.value,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => TextField(
                      obscureText: !controller.isConfirmPasswordVisible.value,
                      scrollPadding: EdgeInsets.only(bottom: 35.0.h),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 15.5.h),
                        hintText: 'Password'.tr,
                        // hintStyle: TextStyle(
                        //     fontSize: 25.sp,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: languagecontroller.fontFamily.value,,
                        //     color: const Color(0xff252525)),
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
                    height: 50.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(OnboardingScreen.routeName);
                        },
                        child: Text('Continue'.tr)),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
