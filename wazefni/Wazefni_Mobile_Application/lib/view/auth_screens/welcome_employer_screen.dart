import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/view/auth_screens/Institution_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/corporate_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/employer_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/organization_signup_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';
import 'package:wazefni_iraq/widgets/card_build.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/constants/constants.dart';
import 'package:wazefni_iraq/widgets/infoCard.dart';

class WelcomeEmployerScreen extends StatelessWidget {
  static const routeName = 'WelcomeEmployerScreen';

  const WelcomeEmployerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller languagecontroller = Get.put(Languagecontroller());
    final card1Controller = FlipCardController();
    final card2Controller = FlipCardController();
    final card3Controller = FlipCardController();
    final card4Controller = FlipCardController();

    return Scaffold(
      appBar: MyAppBar(title: "", onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 34.w, 16.w, 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imageAssets.logo2,
                  width: 81.w,
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              Text(
                'Welcome'.tr,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyColor,
                    fontFamily: languagecontroller.fontFamily.value),
              ),
              SizedBox(
                height: 12.w,
              ),
              Text(
                textAlign: TextAlign.center,
                'Create your account to connect with top talent and link competencies to opportunities for business success.'
                    .tr,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                    fontFamily: languagecontroller.fontFamily.value),
              ),
              SizedBox(
                height: 32.w,
              ),
              Align(
                alignment: languagecontroller.language.value == "ar"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.start,
                  "Choose your industry account type".tr,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: languagecontroller.fontFamily.value),
                ),
              ),
              SizedBox(
                height: 32.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipCard(
                    onTapFlipping: false,
                    frontWidget: cardBuild(
                      show_info: true,
                      onTapIcon: () {
                        card1Controller.flipcard();
                      },
                      icon: SvgPicture.asset(
                        svgAssets.Special_projects,
                        height: 32.w,
                      ),
                      label: 'Special projects'.tr,
                      subLabel: "I’m a business owner looking for employees".tr,
                      onTap: () {
                        Get.toNamed(EmployerSignupScreen.routeName);
                      },
                    ),
                    backWidget: infoCard(
                      onTapIcon: () {
                        card1Controller.flipcard();
                      },
                      label: 'Small & Medium'.tr,
                      subLabel:
                          "Shops, restaurants, markets, and small factories".tr,
                      onTap: () {
                        Get.toNamed(EmployerSignupScreen.routeName);
                      },
                    ),
                    controller: card1Controller,
                    rotateSide: RotateSide.bottom,
                  ),
                  Spacer(),
                  FlipCard(
                    onTapFlipping: false,
                    frontWidget: cardBuild(
                      show_info: true,
                      onTapIcon: () {
                        card2Controller.flipcard();
                      },
                      icon: SvgPicture.asset(
                        svgAssets.Companies,
                        height: 32.w,
                      ),
                      label: 'Companies'.tr,
                      subLabel: 'We are a company looking for employees'.tr,
                      onTap: () {
                        Get.toNamed(CorporateSignupScreen.routeName);
                      },
                    ),
                    backWidget: infoCard(
                      onTapIcon: () {
                        card2Controller.flipcard();
                      },
                      label: 'Large & Medium'.tr,
                      subLabel:
                          'Financial, industrial, tourisim, tech and service companies'
                              .tr,
                      onTap: () {
                        Get.toNamed(CorporateSignupScreen.routeName);
                      },
                    ),
                    controller: card2Controller,
                    rotateSide: RotateSide.bottom,
                  ),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipCard(
                    onTapFlipping: false,
                    frontWidget: cardBuild(
                      show_info: true,
                      onTapIcon: () {
                        card3Controller.flipcard();
                      },
                      icon: SvgPicture.asset(
                        svgAssets.Instituions,
                        height: 32.w,
                      ),
                      label: 'Institutions'.tr,
                      subLabel:
                          'We are an institution looking for employees'.tr,
                      onTap: () {
                        Get.toNamed(InstitutionSignupScreen.routeName);
                      },
                    ),
                    backWidget: infoCard(
                      onTapIcon: () {
                        card3Controller.flipcard();
                      },
                      label: 'Large Entities'.tr,
                      subLabel:
                          'Including Helath, legal, financial and cultural institutions.'
                              .tr,
                      onTap: () {
                        Get.toNamed(InstitutionSignupScreen.routeName);
                      },
                    ),
                    controller: card3Controller,
                    rotateSide: RotateSide.bottom,
                  ),
                  Spacer(),
                  FlipCard(
                    onTapFlipping: false,
                    frontWidget: cardBuild(
                      show_info: true,
                      onTapIcon: () {
                        card4Controller.flipcard();
                      },
                      icon: SvgPicture.asset(
                        svgAssets.Organizations,
                        height: 32.w,
                      ),
                      label: 'Organizations'.tr,
                      subLabel:
                          'We are an organization looking for employees'.tr,
                      onTap: () {
                        Get.toNamed(OrganizationSignupScreen.routeName);
                      },
                    ),
                    backWidget: infoCard(
                      onTapIcon: () {
                        card4Controller.flipcard();
                      },
                      label: 'Social Organizations'.tr,
                      subLabel:
                          'Including Health, educational, cultural, and charity fields'
                              .tr,
                      onTap: () {
                        Get.toNamed(InstitutionSignupScreen.routeName);
                      },
                    ),
                    controller: card4Controller,
                    rotateSide: RotateSide.bottom,
                  ),
                ],
              ),
              SizedBox(
                height: 103.w,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Aready have an Account?'.tr,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontFamily: languagecontroller.fontFamily.value),
                      children: [
                    TextSpan(
                      text: ' Log In'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orangeColor,
                          fontFamily: languagecontroller.fontFamily.value),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to the login screen
                          Get.toNamed(SigninScreen.routeName);
                        },
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
