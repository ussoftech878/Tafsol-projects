import 'dart:ui'; // Import this for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/create_agreement_controller.dart';

void showRequestExtensionDialogBox(BuildContext context) {
  CreateAgreementController controller = Get.put(CreateAgreementController());
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
                width: 1,
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
                        'Request an Extension',
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
                      )
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Set the Duration (In days)',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.kBlackText,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F9FE),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                          color: Color(0xffB3B3B3)), // Outline border
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.decrement();
                          },
                          child: Icon(
                            Icons.remove,
                            color: Color(0xff4A4A4A),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.extCount.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffB3B3B3),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.increment();
                          },
                          child: Icon(
                            Icons.add,
                            color: Color(0xff4A4A4A),
                          ),
                        ),
                      ],
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
