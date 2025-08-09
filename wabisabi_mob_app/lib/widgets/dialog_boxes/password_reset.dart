// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/views/auth_sceens.dart/sign_in/sign_in_screen.dart';

void showPassResetDialogBox(BuildContext context) {
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
                  width: 300.w, child: Image.asset("assets/svg/1234567.png")),
              Container(
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Text(
                        'Your password is updated!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: const Color(0xff0E253A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Text(
                        'Now you can create secure, automated agreements and make seamless transactions—all in one place.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontSize: 14.sp,
                          color: const Color(0xff63809A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.until((route) =>
                                route.settings.name == SignInScreen.routeName);
                          },
                          child: Text(
                            'Proceed To App',
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
