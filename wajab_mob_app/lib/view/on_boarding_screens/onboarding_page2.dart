import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/onboarding_controller.dart';

class OnboardingPage2 extends GetView<OnboardingController> {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              svgAssets.onBoarding2,
              width: 273.w,
            )),
            SizedBox(
              height: 35.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Quick and easy pickup'.tr,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    color: const Color(0xff252525))),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Text(
                  textAlign: TextAlign.center,
                  'Once you\'ve reserved a meal, just swing\nby the store and pick it up.'.tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff8E8E8E),
                      fontFamily:
                          controller.languagecontroller.fontFamily.value,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      ),
    );
  }
}
