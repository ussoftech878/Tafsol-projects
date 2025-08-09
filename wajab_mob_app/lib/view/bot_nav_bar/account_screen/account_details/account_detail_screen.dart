import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/constants/colors_constants.dart';
import 'package:wajba_mobile_app/controllers/account_screen_controller.dart';
import 'package:wajba_mobile_app/view/auth_screens/change_password_screen.dart';
import 'package:wajba_mobile_app/view/bot_nav_bar/account_screen/account_details/edit_profile_screen.dart';
import 'package:wajba_mobile_app/widgets/custom_textfield.dart';
import 'package:wajba_mobile_app/widgets/input_formatter.dart';

import '../../../../widgets/custom_back_button_app_bar.dart';

class AccountDetailScreen extends GetView<AccountScreenController> {
  static const routeName = 'AccountDetailScreen1';
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomBackButtonAppBar(title: 'Account details'.tr, actionsButton: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: GestureDetector(
              onTap: () {
                Get.toNamed(EditProfileScreen.routeName);
              },
              child: SvgPicture.asset(
                svgAssets.editProfile,
                width: 24.w,
              )),
        )
      ]),

      /*appBar: AppBar(
        leadingWidth: 48.w,
        title: const Text(
          'Account Details',
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 27.w),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(EditProfileScreen.routeName);
                },
                child: SvgPicture.asset(
                  svgAssets.editProfile,
                  width: 24.w,
                )),
          )
        ],
      ),*/
      body: Padding(
        padding:
            EdgeInsets.only(left: 27.w, right: 27.w, bottom: 27.h, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name'.tr,
                style: TextStyle(
                    color: AppColors.kTextGreyColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp)),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Sara',
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text('Last Name'.tr,
                style: TextStyle(
                    color: AppColors.kTextGreyColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp)),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Ahmed',
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text('Email'.tr,
                style: TextStyle(
                    color: AppColors.kTextGreyColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp)),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextFormField(
              enabled: false,
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
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp)),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Female'.tr,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text('Phone Number'.tr,
                style: TextStyle(
                    color: AppColors.kTextGreyColor,
                    fontFamily: controller.languagecontroller.fontFamily.value,
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
                    enabled: false,
                    onChanged: (text) {
                      // Handle phone number changes
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneNumberInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEBEBEB),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide.none, // No border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE2E5E8)), // Custom border
                        borderRadius: BorderRadius.circular(11),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffE2E5E8)), // Same as enabledBorder
                        borderRadius: BorderRadius.circular(11),
                      ),
                      hintText: '3333 3333',
                      hintStyle: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily:
                              controller.languagecontroller.fontFamily.value,
                          color: const Color(0xffB3B3B3)),
                      prefixIcon: IntrinsicHeight(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // showCountryPicker(
                                  //   context: context,
                                  //   showPhoneCode: true,
                                  //   onSelect: (Country country) {
                                  //     controller.selectedCountryCode.value =
                                  //         '+${country.phoneCode}';
                                  //     controller.selectedFlag.value = country.flagEmoji;
                                  //   },
                                  // );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.w, right: 4.w),
                                      child: Text(
                                        controller
                                            .ccpController.selectedFlag.value,
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                        ), // Adjust flag size
                                      ),
                                    ),
                                    Text(
                                      controller.ccpController
                                          .selectedCountryCode.value,
                                      style: TextStyle(
                                        color: const Color(0xffB3B3B3),
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
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 11.0),
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
                    Get.toNamed(ChangePasswordScreen.routeName);
                  },
                  child: Text('Change Password'.tr)),
            )
          ],
        ),
      ),
    );
  }
}
