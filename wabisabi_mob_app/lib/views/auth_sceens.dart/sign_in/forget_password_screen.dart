import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';
import 'package:wabisabi_mob_app/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends GetView<ForgetPasOnBoardingController> {
  static const routeName = 'ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 25.h),
                        Text(
                          'Forget Password',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32.sp),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          textAlign: TextAlign.center,
                          'Enter your registered email address to receive password reset instructions.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.kTextGreyColor,
                                  fontSize: 14.sp),
                        ),
                        SizedBox(height: 28.h),
                        CustomTextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email cannot be empty';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                        SizedBox(height: 200.h),
                        Text(
                            textAlign: TextAlign.center,
                            'Check your inbox for reset instructions. If you don’t receive an email, check your spam folder.',
                            style: TextStyle(
                                color: AppColors.kTextGreyColor,
                                fontSize: 14.sp)),
                        // const Spacer(),

                        // SizedBox(height: 88.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    visible: !isKeyboardVisible,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.nextPage();
                              /* controller.forgetPassword().then((value) {
                                if (value) {
                                  controller.nextPage();
                                }
                              }); */
                            }
                          },
                          child: const Text('Recover Password')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
