import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/create_agreement_controller.dart';
import 'package:wabisabi_mob_app/widgets/dialog_box_button.dart';

void showAddFieldDialogBox(
    BuildContext context, CreateAgreementController controller) {
  TextEditingController fieldController = TextEditingController();

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
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Apply blur
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white, // Dialog background color
              border: Border.all(
                color: Color(0xffB3B3B3),
                width: 1.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.start,
                      'Field Name',
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4A4A4A))),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    controller: fieldController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 14.sp, color: const Color(0xffB3B3B3)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DialogBoxButton(
                      text: 'Done',
                      onPressed: () {
                        if (fieldController.text.trim().isNotEmpty) {
                          controller.addField(fieldController.text.trim());
                        }
                        Get.back();
                      },
                      color: AppColors.kPrimaryColor,
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
