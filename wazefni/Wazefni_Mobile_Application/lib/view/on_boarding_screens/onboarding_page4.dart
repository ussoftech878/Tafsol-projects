import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';

import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';

import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/view/auth_screens/welcome_employer_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/welcome_screen.dart';
import 'package:wazefni_iraq/widgets/Welcom%20card_build%20.dart';
import 'package:wazefni_iraq/widgets/card_build.dart';

class OnboardingPage4 extends StatelessWidget {
  static const routeName = 'OnboardingPage4';

  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller langController = Get.put(Languagecontroller());
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/car.jpg', // Replace with your car image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SvgPicture.asset(
                langController.language.value == "en"
                    ? svgAssets.bg
                    : svgAssets.bg_arab,
                width: 375.w,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              SvgPicture.asset(
                svgAssets.bg2,
                width: 375.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const OnboardingScreen4_2()
        ],
      ),
    );
  }
}

class OnboardingScreen4_2 extends StatelessWidget {
  static const routeName = 'OnboardingScreen4_2';

  const OnboardingScreen4_2({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller langController = Get.put(Languagecontroller());
    return Padding(
      padding:
          EdgeInsets.only(top: 75.w, left: 16.w, right: 16.w, bottom: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Create account".tr,
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.orangeColor,
              fontWeight: FontWeight.w700,
              fontFamily: langController.fontFamily.value,
            ),
          ),
          const Spacer(),
          // Options
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: WelcomecardBuild(
                  show_info: false,
                  icon: SvgPicture.asset(
                    svgAssets.editicon,
                    height: 48.w,
                  ),
                  label: "Employers".tr,
                  subLabel: "Look for Employees".tr,
                  onTap: () {
                    Get.toNamed(WelcomeEmployerScreen.routeName);
                  },
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: WelcomecardBuild(
                  show_info: false,
                  icon: SvgPicture.asset(
                    svgAssets.search,
                    height: 48.w,
                  ),
                  label: "Job seeker".tr,
                  subLabel: "Look for jobs".tr,
                  onTap: () {
                    Get.toNamed(WelcomeScreen.routeName);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 47.w,
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("About Us".tr,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: langController.fontFamily.value,
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(SigninScreen.routeName);
                },
                child: Text(
                  "Sign In".tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: langController.fontFamily.value,
                      color: AppColors.orangeColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
