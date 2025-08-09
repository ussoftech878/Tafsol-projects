import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 75.h,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffB3B3B3)),
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Text('Bob has updated the milestone',
                // overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12.sp, color: AppColors.kBlackText))),
              ),
              Spacer(),
              Text('12/12/2025',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10.sp, color: AppColors.kBlackText))),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text('Deadline',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12.sp, color: AppColors.kBlackText))),
              Spacer(),
              Text('12:00pm',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 10.sp, color: AppColors.kBlackText))),
            ],
          ),
        ],
      ),
    );
  }
}
