import 'dart:ui'; // Import this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

void showResolveContract2DialogBox2(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // Removes dim effect
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffB3B3B3), width: 1), // Border style
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Apply blur
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Color(0xffB3B3B3), // Outline border color
                width: 1.w,
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
                        'Resolve Contract',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.kBlackText,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(svgAssets.dcancel,
                            width: 24.w, height: 24.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Both parties will have to pay the price of partial refunds, payment withholding. The amount is \$50.00.\n\nAre you sure you want to continue the process?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Color(0xff4A4A4A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Yes'))),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {}, child: Text('No'))),
                    ],
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
