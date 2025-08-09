import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class SuggestionText extends StatelessWidget {
  const SuggestionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Color(0xffECECEC), borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: AppColors.kScaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Hey! How are you?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10.sp, color: Color(0xff999999)))),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: AppColors.kScaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                      textAlign: TextAlign.center,
                      'The deadline has reached',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10.sp, color: Color(0xff999999)))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: AppColors.kScaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                      textAlign: TextAlign.center,
                      'Are we meeting this week?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10.sp, color: Color(0xff999999)))),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: AppColors.kScaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                      textAlign: TextAlign.center,
                      'I am Good',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10.sp, color: Color(0xff999999)))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
