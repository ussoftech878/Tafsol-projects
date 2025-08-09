// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/constants/constants.dart';
import 'package:wabisabi_mob_app/controllers/signup_on_boarding_controller.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/credentials_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/otp_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/phone_number_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/sign_up_screen.dart';

// ignore: must_be_immutable
class SignUpOnBoarding extends GetView<SignUpOnboardingController> {
  // OnboardingController controller = Get.put(OnboardingController());
  static const routeName = 'OnBoarding';
  const SignUpOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      SignUpScreen(),
      OtpScreen(),
      PhoneNumberScreen(),
      const CredentialsScreen()
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
                              borderRadius: BorderRadius.circular(50.r)),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 38.h,
              ),
            ],
          ),
        ),
      );
    });
  }
}
