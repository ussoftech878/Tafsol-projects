import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';

class DocContainer extends StatelessWidget {
  const DocContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109.w,
      height: 157.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
      // margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAssets.doc,
            width: 89.w,
            height: 94.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 11.h),
          Text(
            'Rental Agreement',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: Color(0xff4A4A4A))),
          )
        ],
      ),
    );
  }
}
