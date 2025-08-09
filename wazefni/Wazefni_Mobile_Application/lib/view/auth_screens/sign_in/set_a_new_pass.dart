import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';
import 'package:wazefni_iraq/widgets/custom_elevated_button.dart';
import 'package:wazefni_iraq/widgets/custom_textfield.dart';

import '../../../controllers/NewPassController.dart';

class SetANewPass extends StatefulWidget {
  static const routeName = 'SetANewPass';
  const SetANewPass({super.key});
  @override
  State<SetANewPass> createState() => _SetANewPassState();
}

class _SetANewPassState extends State<SetANewPass> {
  final Newpasscontroller controller = Newpasscontroller();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Languagecontroller langController = Get.put(Languagecontroller());
    return Scaffold(
      appBar: MyAppBar(title: '', onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Set a new password'.tr,
                  style: TextStyle(
                    fontFamily: langController.fontFamily.value,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Create a strong secure password to protect your account'
                          .tr,
                      style: TextStyle(
                          fontFamily: langController.fontFamily.value,
                          color: const Color(0xff141414),
                          fontSize: 12.sp)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    isPassword: true,
                    controller: controller.passwordController,
                    onchange: () {
                      if (_formKey.currentState!.validate()) {
                        controller.isEnabled.value = true;
                      } else {
                        controller.isEnabled.value = false;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'.tr;
                      } else if (value.length < 6) {
                        return 'The password must be at least 6 numbers or letters'
                            .tr;
                      }
                      return null;
                    },
                    obscureText: !controller.isPasswordVisible1.value,
                    decoration: InputDecoration(
                      hintText: "New Password".tr,
                      border: const OutlineInputBorder(),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.square_lock2,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isPasswordVisible1.value =
                              !controller.isPasswordVisible1.value;
                        },
                        icon: controller.isPasswordVisible1.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff949494),
                                size: 20.w,
                              )
                            : SvgPicture.asset(
                                svgAssets.eye_hide,
                                fit: BoxFit.scaleDown,
                                width: 20.w,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    isPassword: true,
                    controller: controller.passwordConfirmController,
                    onchange: () {
                      if (_formKey.currentState!.validate()) {
                        controller.isEnabled.value = true;
                      } else {
                        controller.isEnabled.value = false;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'.tr;
                      } else if (value.length < 6) {
                        return 'The password must be at least 6 numbers or letters'
                            .tr;
                      } else if (value != controller.passwordController.text) {
                        return 'Password didnt match'.tr;
                      }
                      return null;
                    },
                    obscureText: !controller.isPasswordVisible2.value,
                    decoration: InputDecoration(
                      hintText: "Confirm password".tr,
                      border: const OutlineInputBorder(),
                      prefixIcon: SvgPicture.asset(
                        svgAssets.square_lock2,
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isPasswordVisible2.value =
                              !controller.isPasswordVisible2.value;
                        },
                        icon: controller.isPasswordVisible2.value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff949494),
                                size: 20.w,
                              )
                            : SvgPicture.asset(
                                svgAssets.eye_hide,
                                fit: BoxFit.scaleDown,
                                width: 20.w,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 140.h,
                ),
                Obx(() => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("save");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isEnabled.value
                              ? null
                              : Color(0xffFFD8BF),
                        ),
                        child: Text('Save'.tr),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
