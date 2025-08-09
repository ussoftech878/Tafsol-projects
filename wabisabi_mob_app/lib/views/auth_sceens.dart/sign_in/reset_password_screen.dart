import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/password_reset.dart';

class ResetPasswordScreen extends GetView<ForgetPasOnBoardingController> {
  static const routeName = 'ResetPasswordScreen';
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final showError = ValueNotifier<bool>(false);

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 25.h),
                  Text(
                    'Reset Password',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.sp),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kTextGreyColor, fontSize: 14.sp),
                  ),
                  SizedBox(height: 24.h),
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.paswordController,
                      obscureText: !controller.isPasswordVisible.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return controller.checkPasswordStrength(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: showError.value &&
                                controller.paswordController.text.isEmpty
                            ? 'Password is required'
                            : null,
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
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.confirmPaswordController,
                      obscureText: !controller.isConfirmPasswordVisible.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm password is required';
                        }
                        return controller.checkConfirmPassword(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isConfirmPasswordVisible.value =
                                  !controller.isConfirmPasswordVisible.value;
                            },
                            icon: controller.isConfirmPasswordVisible.value
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

                  const Spacer(),
                  Visibility(
                    visible: !isKeyboardVisible,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (controller.paswordController.text !=
                                  controller.confirmPaswordController.text) {
                                return;
                              }
                              Get.offAllNamed(SignInScreen.routeName);
                                  showPassResetDialogBox(context);
                              /* controller.resetPassword().then((value) {
                                //showPassResetDialogBox(context);
                                if (value) {
                                  Get.offAllNamed(SignInScreen.routeName);
                                  showPassResetDialogBox(context);
                                }
                              }); */
                            }
                          },
                          child: const Text('Submit')),
                    ),
                  ),
                  // k2hSizedBox,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
