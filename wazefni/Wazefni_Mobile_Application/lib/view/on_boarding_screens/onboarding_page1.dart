import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/controllers/onboarding_controller.dart';

// ignore: must_be_immutable
class OnboardingPage1 extends StatelessWidget {
  OnboardingController controller = Get.put(OnboardingController());
  Languagecontroller lang_controller = Get.put(Languagecontroller());

  OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.w, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.w,
                        width: 116.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.w),
                            border: Border.all(color: AppColors.greyColor)),
                        child: Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (lang_controller.language.value == "ar") {
                                    lang_controller.toggleLanguage();
                                  }
                                  //print(lang_controller.language.value);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 2.w),
                                    decoration: ShapeDecoration(
                                      color:
                                          lang_controller.language.value == "en"
                                              ? AppColors.greyColor
                                              : Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                      ),
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'English',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              lang_controller.language.value ==
                                                      "en"
                                                  ? Colors.white
                                                  : AppColors.greyColor,
                                          fontFamily: "SFPRODISPLAYREGULAR",
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  if (lang_controller.language.value == "en") {
                                    lang_controller.toggleLanguage();
                                  }
                                  //print(lang_controller.language.value);
                                },
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    decoration: ShapeDecoration(
                                      color:
                                          lang_controller.language.value == "ar"
                                              ? AppColors.greyColor
                                              : Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2.0.w),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'عربي',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: lang_controller
                                                        .language.value ==
                                                    "ar"
                                                ? Colors.white
                                                : AppColors.greyColor,
                                            fontFamily: "Almarai",
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.skipToLast();
                        },
                        child: Text('Skip'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: lang_controller.fontFamily.value,
                            )),
                      )
                      /*TextButton(
                            onPressed: () {
                              controller.skipToLast();
                            },
                            child: Text(
                              'Skip'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.orangeColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: lang_controller.fontFamily.value,
                              )
                            )),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 39.w,
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Animate(
                      child: Image.asset(
                        "assets/png/job_seeker_image.png",
                        width: 135.w,
                        fit: BoxFit.cover,
                      ),
                    ).slide(
                        duration: const Duration(milliseconds: 500),
                        begin: Offset(-2.w, 0.h),
                        end: Offset(0.w, 0.h),
                        curve: Curves.linear),
                    SizedBox(
                      width: 19.5.w,
                    ),
                    Animate(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Goodbye to efforts and expenses'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 7.67.w,
                          ),
                          SizedBox(
                            width: 179.w,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Find the best oppurtunities without moving or searching'
                                  .tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: lang_controller.fontFamily.value,
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).slide(
                        duration: const Duration(milliseconds: 500),
                        begin: Offset(2.w, 0.h),
                        end: Offset(0.w, 0.h),
                        curve: Curves.linear),
                  ],
                ),
                SizedBox(
                  height: 24.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    // k1wSizedBox,
                    Animate(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Quick and effective hiring'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 7.67.w,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Qualified candidates are at your fingertips'.tr,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: lang_controller.fontFamily.value,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ).slide(
                        duration: const Duration(milliseconds: 500),
                        begin: Offset(-2.w, 0.h),
                        end: Offset(0.w, 0.h),
                        // delay: Duration(seconds: 1),
                        curve: Curves.linear),
                    SizedBox(
                      width: 19.5.w,
                    ),
                    Animate(
                      child: Image.asset(
                        "assets/png/employ_image.png",
                        width: 135.w,
                        fit: BoxFit.cover,
                      ),
                    ).slide(
                        duration: const Duration(milliseconds: 500),
                        begin: Offset(2.w, 0.h),
                        end: Offset(0.w, 0.h),
                        // delay: Duration(seconds: 1),
                        curve: Curves.linear),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 133.w),
            child: Column(
              children: [
                Text(
                  'wazefni_iraq'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: lang_controller.fontFamily.value,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'description'.tr,
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
