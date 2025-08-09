import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/KYC_verification_screens/verify_profile_screen.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';

void showPinSetDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.1),
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300.w,
                  child: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? Image.asset("assets/png/dailog_dark.png")
                      : Image.asset("assets/png/dailog.png")),
              Container(
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? Color(0xff555555)
                      : Colors.white,
                  border: Get.find<ThemeController>().themeMode.value ==
                          ThemeMode.dark
                      ? Border(
                          // top: BorderSide(color: Colors.blue, width: 2),
                          bottom: BorderSide(
                              color: AppColors.kPrimaryColor, width: 2),
                          left: BorderSide(
                              color: AppColors.kPrimaryColor, width: 2),
                          right: BorderSide(
                              color: AppColors.kPrimaryColor, width: 2),
                        )
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Text(
                        'Great! Your PIN is set.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Text(
                        'You’re all set! Enjoy secure, instant payments and smart contract automation with Wabi Sabi Pay',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(SignInScreen.routeName);
                            Get.toNamed(VerifyProfileScreen.routeName);
                          },
                          child: Text(
                            'Start Using Wabi Sabi Pay',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
