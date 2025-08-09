// ignore_for_file: deprecated_member_use

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/reset_password.dart';
import 'package:wajba_mobile_app/widgets/custom_textfield.dart';
import 'package:wajba_mobile_app/widgets/input_formatter.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';
import '../../../../widgets/gender_container.dart';

class EditProfileScreen extends GetView<AccountScreenController> {
  static const routeName = 'EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBackButtonAppBar(title: 'Edit Profile'.tr),

/*
        appBar: AppBar(
          leadingWidth: 48.w,
          title: const Text(
            'Edit Profile',
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 27).w,
            child: InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                svgAssets.backArrow,
              ),
            ),
          ),
        ),
*/
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 27.w, right: 27.w, bottom: 27.h, top: 24.h),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name'.tr,
                      style: TextStyle(
                          color: AppColors.kTextGreyColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Sara',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text('Last Name'.tr,
                      style: TextStyle(
                          color: AppColors.kTextGreyColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Ahmed',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          color: const Color(0xff252525)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text('Email'.tr,
                      style: TextStyle(
                          color: AppColors.kTextGreyColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomTextFormField(
                    decoration: InputDecoration(
                      hintText: 'sarahmed@gmail.com',
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text('Gender'.tr,
                      style: TextStyle(
                          color: AppColors.kTextGreyColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
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
                    height: 32.h,
                  ),
                  Text('Phone Number'.tr,
                      style: TextStyle(
                          color: AppColors.kTextGreyColor,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      children: [
                        TextField(
                          scrollPadding: EdgeInsets.only(bottom: 35.0.h),
                          onChanged: (text) {
                            // Handle phone number changes
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            PhoneNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            hintText: '3333 3333',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: controller
                                    .languagecontroller.fontFamily.value,
                                color: const Color(0xff252525)),
                            prefixIcon: IntrinsicHeight(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        showCountryPicker(
                                          context: context,
                                          showPhoneCode: true,
                                          onSelect: (Country country) {
                                            controller.ccpController
                                                    .selectedCountryCode.value =
                                                '+${country.phoneCode}';
                                            controller
                                                .ccpController
                                                .selectedFlag
                                                .value = country.flagEmoji;
                                          },
                                        );
                                      },
                                      child: Obx(
                                        () => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 12.w, right: 4.w),
                                              child: Text(
                                                controller.ccpController
                                                    .selectedFlag.value,
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                ), // Adjust flag size
                                              ),
                                            ),
                                            Text(
                                              controller.ccpController
                                                  .selectedCountryCode.value,
                                              style: TextStyle(
                                                color: AppColors.forestColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: controller
                                                    .languagecontroller
                                                    .fontFamily
                                                    .value,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 11.0),
                                    child: VerticalDivider(
                                      color: Color(0xffE2E5E8),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Update Profile'.tr)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(ResetPassword.routeName);
                        },
                        child: Text(
                            textAlign: TextAlign.center,
                            'Delete Account'.tr,
                            style: TextStyle(
                                color: const Color(0xffF16055),
                                fontWeight: FontWeight.w600,
                                fontFamily: controller
                                    .languagecontroller.fontFamily.value,
                                fontSize: 14.sp)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
