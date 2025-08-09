// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/set_pin_code_screen.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class CredentialsScreen extends GetView<SignUpOnboardingController> {
  static const routeName = 'CredentialsScreen';
  const CredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text('Your Credentials',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp)),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      'Create your unique ID so people can look up and make payment to you',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14.sp)),
                  SizedBox(
                    height: 28.h,
                  ),
                  CustomTextFormField(
                    // style: TextStyle(fontSize: 16.sp),
                    controller: controller.wabisabiIdController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Wabisabi ID';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Wabisabi ID'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Spacer(),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  controller.updateWabisabiId().then((value) {
                                    if (value) {
                                      Get.toNamed(SetPinCodeScreen.routeName);
                                    }
                                  });
                                }
                                //  Get.toNamed(SetPinCodeScreen.routeName);
                              },
                              child: const Text('Continue')),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'By continuing, you agree to our ',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color,
                                    fontSize: 14.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms of service ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.kPrimaryColor),
                                    ),
                                    TextSpan(
                                      text: 'and ',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy policy.',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.kPrimaryColor),
                                    ),
                                  ])),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
