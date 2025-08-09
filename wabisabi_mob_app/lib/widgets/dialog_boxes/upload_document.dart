import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

void showUploadDocumentDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // Remove the dim effect
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Transparent background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Color(0xffB3B3B3), // Set border color
                width: 1, // Set border width
              ),
              color: Colors.white, // Dialog background color
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Freelance Design Project',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13.sp, color: AppColors.kBlackText)),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(svgAssets.dcancel,
                            width: 24.w, height: 24.h),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Uploaded Document',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.kBlackText)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 28.h),
                    decoration: BoxDecoration(
                        color: Color(0xffF5F9FE),
                        border: Border.all(
                          color: Color(0xffB3B3B3),
                        ),
                        borderRadius: BorderRadius.circular(14.r)),
                    child: Column(
                      children: [
                        SvgPicture.asset(svgAssets.document,
                            width: 24.w, height: 24.h),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Document Name',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.kBlackText)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
