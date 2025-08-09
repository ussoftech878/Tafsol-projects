import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wazefni_iraq/controllers/LanguageController.dart';
import 'package:wazefni_iraq/widgets/custom_app_bar.dart';
import 'package:wazefni_iraq/widgets/custom_button.dart';
import 'package:wazefni_iraq/constants/assets.dart';
import 'package:wazefni_iraq/constants/colors_constants.dart';
import 'package:wazefni_iraq/view/auth_screens/signin_screen.dart';
import 'package:wazefni_iraq/view/auth_screens/signup_screen.dart';

// welcome screen
class WelcomeScreen extends StatelessWidget {
  static const routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Languagecontroller langController = Get.put(Languagecontroller());
    return Scaffold(
      appBar: MyAppBar(title: "", onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 34.w, 0.w, 48.w),
                child: Center(
                  child: Image.asset(
                    imageAssets.logo2,
                    width: 81.w,
                  ),
                ),
              ),
              Text(
                'Welcome'.tr,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: langController.fontFamily.value,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 12.w,
              ),
              Text(
                textAlign: TextAlign.center,
                'welcome_description'.tr,
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: langController.fontFamily.value,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 32.w,
              ),
              CustomButton(
                text: 'Register with Facebook'.tr,
                onPressed: () {},
                icon: Image.asset(
                  imageAssets.facebookLogo,
                  width: 20.w,
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              CustomButton(
                text: 'Sign Up with Google'.tr,
                onPressed: () {},
                icon: Image.asset(imageAssets.googleLogo),
              ),
              SizedBox(
                height: 16.w,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/png/Line 1.png"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "or".tr,
                      style: TextStyle(
                          fontFamily: langController.fontFamily.value,
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset("assets/png/Line 1.png")
                  ]),
              SizedBox(
                height: 8.w,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(SignupScreen.routeName);
                      },
                      child: Text(
                        'Create a new account'.tr,
                        style: TextStyle(
                            fontFamily: langController.fontFamily.value),
                      ))),
              SizedBox(
                height: 170.w,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(SigninScreen.routeName);
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Aready have an Account?'.tr,
                        style: TextStyle(
                            fontFamily: langController.fontFamily.value,
                            color: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                        children: [
                      TextSpan(
                        text: ' Log In'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.orangeColor,
                            fontFamily: langController.fontFamily.value,
                            fontSize: 14.sp),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
