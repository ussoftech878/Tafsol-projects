import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/onboarding_controller.dart';

class OnboardingPage1 extends GetView<OnboardingController> {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              svgAssets.onBoarding1,
              width: 273.w,
            )),
            SizedBox(
              height: 35.h,
            ),
            Text(
              textAlign: TextAlign.center,
              'Find great deals'.tr,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: controller.languagecontroller.fontFamily.value,
                  color: const Color(0xff252525)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Discover local spots with delicious food\nthat\'s too good to waste.'.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xff8E8E8E),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      ),
    );
  }
}
