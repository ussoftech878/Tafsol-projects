import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';

class RecieverMsg extends StatelessWidget {
  const RecieverMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imageAssets.person, width: 24.w, height: 24.h),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xffDCDCDC),
                borderRadius: BorderRadius.circular(20.r),
              ),
              constraints: BoxConstraints(
                maxWidth: 0.7.sw, // Ensures text wraps properly
              ),
              child: Text(
                  'Hi Bob, I’m excited to get started on the logo. Can we discuss the details?',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500))),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text('03:12  AM',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999999)))),
          ],
        )
      ],
    );
  }
}
