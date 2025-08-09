import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

void showViewExtensionRequestDialogBox(BuildContext context) {
  // CreateAgreementController controller = Get.put(CreateAgreementController());
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
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
                        'Extension Request',
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
                    height: 7.h,
                  ),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: 'Freelance Design Project',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff4A4A4A))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: '4 Days',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff4A4A4A))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                textStyle: TextStyle(
                                    color: AppColors.kBlackText,
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.r)),
                                backgroundColor: Color(0xff34C759),
                                foregroundColor: Colors.white,
                                elevation: 0,
                              ),
                              child: Text('Approve'))),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                textStyle: TextStyle(
                                    color: AppColors.kBlackText,
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.r)),
                                backgroundColor: Color(0xffFD2727),
                                foregroundColor: Colors.white,
                                elevation: 0,
                              ),
                              child: Text('Reject'))),
                    ],
                  )
                ],
              ),
            ));
      });
}
