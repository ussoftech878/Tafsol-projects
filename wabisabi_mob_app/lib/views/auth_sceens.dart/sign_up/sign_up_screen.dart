import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class SignUpScreen extends GetView<SignUpOnboardingController> {
  static const routeName = 'SignUpSreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 84.h,
                        ),
                        Text('Sign Up',
                            style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.sp)),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Create your account to manage payments and agreements securely.',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        // First Name Field
                        CustomTextFormField(
                          controller: controller.firstNameController,
                          decoration:
                              const InputDecoration(hintText: 'First Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Last Name Field
                        CustomTextFormField(
                          controller: controller.lastNameController,
                          decoration:
                              const InputDecoration(hintText: 'Last Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Email Field
                        CustomTextFormField(
                          style: TextStyle(fontSize: 16.sp),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: const InputDecoration(hintText: 'Email'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email cannot be empty';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Password Field
                        Obx(
                          () => CustomTextFormField(
                            style: TextStyle(fontSize: 16.sp),
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !controller.isPasswordVisible.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return controller.checkPasswordStrength(value);
                            },
                            onChanged: (value) {
                              // controller.confirmPasswordController(value);
                              // controller.isTypingPassword.value = true;
                              // controller.isTypingConfirmPassword.value = false;
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
                                          size: 24.sp,
                                        )
                                      : Icon(
                                          Icons.visibility_off_outlined,
                                          size: 24.sp,
                                        )),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Confirm Password Field
                        Obx(
                          () => CustomTextFormField(
                            style: TextStyle(fontSize: 16.sp),
                            controller: controller.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                !controller.isConfirmPasswordVisible.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password is required';
                              }
                              return controller.checkConfirmPassword(value);
                            },
                            onChanged: (value) {
                              controller.isTypingPassword.value = false;
                              controller.isTypingConfirmPassword.value = true;
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.isConfirmPasswordVisible.value =
                                        !controller
                                            .isConfirmPasswordVisible.value;
                                  },
                                  icon:
                                      controller.isConfirmPasswordVisible.value
                                          ? Icon(
                                              Icons.visibility_outlined,
                                              size: 24.sp,
                                            )
                                          : Icon(
                                              Icons.visibility_off_outlined,
                                              size: 24.sp,
                                            )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (controller.passwordController.text !=
                                      controller
                                          .confirmPasswordController.text) {
                                    return;
                                  }
                                  controller.validate_email().then((value) {
                                    if (value) {
                                      controller.nextPage();
                                    }
                                  });
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Get.offNamed(SignInScreen.routeName);
                              },
                              child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color,
                                          // color: Color(0xff3B4054),
                                          fontSize: 14.sp),
                                      children: [
                                        TextSpan(
                                          text: 'Sign In',
                                          style: TextStyle(
                                              color: AppColors.kPrimaryColor,
                                              fontSize: 14.sp),
                                        )
                                      ])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
