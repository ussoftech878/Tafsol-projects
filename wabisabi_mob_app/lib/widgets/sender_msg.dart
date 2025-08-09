import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class SenderMsg extends StatelessWidget {
  const SenderMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // height: 78.h,
                  constraints: BoxConstraints(
                    maxWidth: 0.7.sw, // Ensures text wraps properly
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.visible,
                      'Of course! I’ll send over an agreement draft so we can align on milestones and payments.',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
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
            ),
            SizedBox(
              width: 8.w,
            ),
            Image.asset(imageAssets.person, width: 24.w, height: 24.h),
          ],
        ),
      ],
    );
  }
}
