import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wajba_mobile_app/constants/assets.dart';
import 'package:wajba_mobile_app/controllers/onboarding_controller.dart';

class OnboardingPage3 extends GetView<OnboardingController> {
  const OnboardingPage3({super.key});

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
              svgAssets.onBoarding3,
              width: 273.w,
            )),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                textAlign: TextAlign.center,
                'Big savings, small changes'.tr,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    color: const Color(0xff252525)),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                textAlign: TextAlign.center,
                'Find discounted food and help reduce\nwaste while keeping your wallet happy.'.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xff8E8E8E),
                    fontFamily: controller.languagecontroller.fontFamily.value,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
