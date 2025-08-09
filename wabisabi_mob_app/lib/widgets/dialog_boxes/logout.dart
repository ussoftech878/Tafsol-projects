import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/services/session_storage_services.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_up/login_with_screen.dart';

void showLogoutDialogBox(BuildContext context) {
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
                        'Are you sure you want to Logout?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: const Color(0xff0E253A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                await SessionStorageService().deleteToken();
                                await SessionStorageService().hasToken()
                                    ? null
                                    : Get.offAllNamed(
                                        LoginWithScreen.routeName);
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
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
