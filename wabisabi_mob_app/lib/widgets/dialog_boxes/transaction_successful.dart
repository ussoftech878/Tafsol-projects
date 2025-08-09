import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';
import 'package:wabisabi_mob_app/views/bot_nav_bar/bot_nav_bar.dart';

void showTransactionSuccessfulDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double dialogWidth = constraints.maxWidth > 600 ? 400.w : 300.w;
          double dialogHeight = constraints.maxWidth > 600 ? 800.h : 800.h;
          double imageWidth =
              constraints.maxWidth > 600 ? 450.w : double.infinity;

          return Dialog(
            backgroundColor: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                height: dialogHeight,
                child: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      Get.find<ThemeController>().themeMode.value ==
                              ThemeMode.dark
                          ? svgAssets.largeDialogBox
                          : svgAssets.largeDialogBox,
                      width: imageWidth,
                      fit: BoxFit.fitWidth,
                    ),
                    // Content Positioned in Center
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: dialogWidth * 0.9,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    constraints.maxWidth > 600 ? 120.w : 110.w),
                            Text(
                              'Payment Completed!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'John Doe',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Bank Name - 14555477884',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Money Transferred',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '\$50.00',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'To',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'John Doe Jr.',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Bank Name - 14555477884',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '12/12/2024 - 12:00 pm',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth > 600
                                        ? 20.w
                                        : 0.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Share Receipt',
                                              style:
                                                  TextStyle(fontSize: 13.sp))),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Get.find<ThemeController>()
                                                                .themeMode
                                                                .value ==
                                                            ThemeMode.dark
                                                        ? AppColors.kWhiteColor
                                                        : Colors.transparent),
                                          ),
                                          onPressed: () {
                                            Get.toNamed(BotNavBar.routeName);
                                          },
                                          child: Text('Go to Dashboard',
                                              style:
                                                  TextStyle(fontSize: 13.sp))),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
