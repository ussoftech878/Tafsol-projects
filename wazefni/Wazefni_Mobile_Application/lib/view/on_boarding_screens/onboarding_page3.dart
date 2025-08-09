import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/onboarding_controller.dart';

// ignore: must_be_immutable
class OnboardingPage3 extends StatelessWidget {
  OnboardingController controller = Get.put(OnboardingController());

  OnboardingPage3({super.key});

  Languagecontroller lang_controller = Get.put(Languagecontroller());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.w, left: 16.w, right: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: null,
                        child: Text(
                          'Skip'.tr,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.greyColor.withOpacity(0.5),
                              fontFamily: lang_controller.fontFamily.value,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.w,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Animate(
                          child: Image.asset(
                            "assets/png/man_onboard3.png",
                            fit: BoxFit.cover,
                            width: 74.w,
                          ),
                        ).slide(
                            // delay: Duration(milliseconds: 1500),
                            duration: const Duration(milliseconds: 2000),
                            begin: Offset(-1.5.w, 0.h),
                            end: Offset(0.w, 0.h),
                            curve: Curves.elasticInOut),
                        SizedBox(
                          width: 8.57.w,
                        ),
                        Animate(
                          child: SvgPicture.asset(
                            svgAssets.Bubble_arrow_left,
                            width: 8.w,
                          ),
                        )
                            .slide(
                                duration: const Duration(milliseconds: 2000),
                                begin: Offset(-1.5.w, 0.h),
                                end: Offset(0.w, 0.h),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 1.w,
                        ),
                        Animate(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 4.w),
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: AppColors.light_peach,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                //TODO: Text ka font change krna hai ??
                                'Share latest news about business.'.tr,
                                // overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: lang_controller.fontFamily.value,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                            .slide(
                                duration: const Duration(milliseconds: 2000),
                                //  delay: Duration(seconds: 1),
                                begin: const Offset(0, 2),
                                end: const Offset(0, 0),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Animate(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 4.w),
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: AppColors.light_peach,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Announce your job vacancies.'.tr,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: lang_controller.fontFamily.value,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                            .slide(
                                duration: const Duration(milliseconds: 2000),
                                delay: const Duration(milliseconds: 500),
                                begin: const Offset(0, 2),
                                end: const Offset(0, 0),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 1.w,
                        ),
                        Animate(
                          child: SvgPicture.asset(
                            svgAssets.Bubble_arrow_right,
                            width: 8.w,
                          ),
                        )
                            .slide(
                                delay: const Duration(milliseconds: 500),
                                duration: const Duration(milliseconds: 2000),
                                begin: Offset(-1.5.w, 0.h),
                                end: Offset(0.w, 0.h),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 8.57.w,
                        ),
                        Animate(
                          child: Image.asset(
                            "assets/png/man_onboard3.png",
                            fit: BoxFit.cover,
                            width: 74.w,
                          ),
                        ).slide(
                            delay: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 2000),
                            begin: Offset(1.5.w, 0.h),
                            end: Offset(0.w, 0.h),
                            curve: Curves.elasticInOut),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Animate(
                          child: Image.asset(
                            "assets/png/Variant28.png",
                            fit: BoxFit.cover,
                            width: 74.w,
                          ),
                        ).slide(
                            delay: const Duration(milliseconds: 1000),
                            duration: const Duration(milliseconds: 2000),
                            begin: Offset(-1.5.w, 0.h),
                            end: Offset(0.w, 0.h),
                            curve: Curves.elasticInOut),
                        SizedBox(
                          width: 8.57.w,
                        ),
                        Animate(
                          child: SvgPicture.asset(
                            svgAssets.Bubble_arrow_left,
                            width: 8.w,
                          ),
                        )
                            .slide(
                                delay: const Duration(milliseconds: 1000),
                                duration: const Duration(milliseconds: 2000),
                                begin: Offset(-1.5.w, 0.h),
                                end: Offset(0.w, 0.h),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 1.w,
                        ),
                        Animate(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 4.w),
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: AppColors.light_peach,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Track applications from anywhere.'.tr,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: lang_controller.fontFamily.value,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                            .slide(
                                duration: const Duration(milliseconds: 2000),
                                delay: const Duration(milliseconds: 1000),
                                begin: const Offset(0, 2),
                                end: const Offset(0, 0),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                      ],
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Animate(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 4.w),
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: AppColors.light_peach,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Sort candidates and set interviews'.tr,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: lang_controller.fontFamily.value,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                            .slide(
                                duration: const Duration(milliseconds: 2000),
                                delay: const Duration(milliseconds: 1500),
                                begin: const Offset(0, 2),
                                end: const Offset(0, 0),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 1.w,
                        ),
                        Animate(
                          child: SvgPicture.asset(
                            svgAssets.Bubble_arrow_right,
                            width: 8.w,
                          ),
                        )
                            .slide(
                                delay: const Duration(milliseconds: 1500),
                                duration: const Duration(milliseconds: 2000),
                                begin: Offset(-1.5.w, 0.h),
                                end: Offset(0.w, 0.h),
                                curve: Curves.elasticInOut)
                            .fadeIn(
                                duration: const Duration(milliseconds: 2000)),
                        SizedBox(
                          width: 8.57.w,
                        ),
                        Animate(
                          child: Image.asset(
                            "assets/png/Variant28.png",
                            fit: BoxFit.cover,
                            width: 74.w,
                          ),
                        ).slide(
                            delay: const Duration(milliseconds: 1500),
                            duration: const Duration(milliseconds: 2000),
                            begin: Offset(1.5.w, 0.h),
                            end: Offset(0.w, 0.h),
                            curve: Curves.elasticInOut),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.w, 65.w, 18.w, 60.w),
            child: Column(
              children: [
                SizedBox(
                  height: 50.w,
                ),
                Text(
                  'For Employers'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: lang_controller.fontFamily.value,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'description3'.tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: lang_controller.fontFamily.value,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
