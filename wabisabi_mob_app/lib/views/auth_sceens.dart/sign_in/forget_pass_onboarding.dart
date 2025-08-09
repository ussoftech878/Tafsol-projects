import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/forget_pass_onboarding_controller.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/forget_password_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/fp_otp_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/reset_password_screen.dart';

class ForgetPassOnboarding extends GetView<ForgetPasOnBoardingController> {
  static const routeName = 'ForgetPassOnboarding';
  const ForgetPassOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ForgetPasswordScreen(),
      FpOtpScreen(),
      const ResetPasswordScreen(),
    ];
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.currentIndex.value > 0) {
            controller.previousPage();
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    controller.currentIndex.value = index;
                  },
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
              // Spacer(),
              k3hSizedBox,
              Obx(() => Visibility(
                    visible: !isKeyboardVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 12.w),
                          width: 30,
                          height: 4,
                          decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? AppColors.kPrimaryColor
                                  : Color(0xffD6DFFF),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 58.h),
            ],
          ),
        ),
      );
    });
  }
}
