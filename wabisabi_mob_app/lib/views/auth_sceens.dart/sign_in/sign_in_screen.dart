import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/signin_onboarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/forget_pass_onboarding.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/signup_onboarding.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/bot_nav_bar.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

import '../../../controllers/theme_controller.dart';

class SignInScreen extends GetView<SignInController> {
  static const routeName = 'SignInScreen';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 81.h),
                      Text(
                        'Sign In',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 32.sp),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        textAlign: TextAlign.center,
                        'Enter your credentials to access your account.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 28.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                        controller: controller.emailController,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: 16.h),
                      Obx(
                        () => CustomTextFormField(
                          controller: controller.passwordController,
                          obscureText: !controller.isPasswordVisible.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isPasswordVisible.value =
                                    !controller.isPasswordVisible.value;
                              },
                              icon: controller.isPasswordVisible.value
                                  ? Icon(
                                      Icons.visibility_outlined,
                                      size: 16.sp,
                                    )
                                  : Icon(Icons.visibility_off_outlined,
                                      size: 16.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(ForgetPassOnboarding.routeName);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color:
                                      Get.find<ThemeController>().themeMode ==
                                              ThemeMode.light
                                          ? Color(0xff7C8BA0)
                                          : null,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Get.offAllNamed(BotNavBar.routeName);
                                      controller.signin().then((value) {
                                        if (value) {
                                          Get.offAllNamed(BotNavBar.routeName);
                                        }
                                      });
                                    }
                                  },
                                  child: controller.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text('Sign In'),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Get.offNamed(SignUpOnBoarding.routeName);
                                },
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal),
                                    children: [
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.kPrimaryColor,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
