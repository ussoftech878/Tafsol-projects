import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/upload_document.dart';

class MilestoneRequestCard extends StatelessWidget {
  const MilestoneRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: Color(0xffB3B3B3),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Alice has requested a milestone',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4A4A4A))),
                        ),
                        Spacer(),
                        Text(
                          'View',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kPrimaryColor)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text('Initial Sketches',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff4A4A4A)))),
                        Spacer(),
                        Text('\$500.00',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff4A4A4A)))),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  showUploadDocumentDialogBox(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  textStyle: TextStyle(
                                      color: AppColors.kBlackText,
                                      fontFamily: 'Poppins',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.r)),
                                  backgroundColor: Color(0xff34C759),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                ),
                                child: Text('Release'))),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  textStyle: TextStyle(
                                      color: AppColors.kBlackText,
                                      fontFamily: 'Poppins',
                                      fontSize: 13.sp,
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
              ),
              SizedBox(
                height: 8.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text('03:12  AM',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff999999)))),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Image.asset(imageAssets.person, width: 24.w, height: 24.h),
      ],
    );
  }
}
