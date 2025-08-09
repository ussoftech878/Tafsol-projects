import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wabisabi_mob_app/constants/assets.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/edit_milestone.dart';
import 'package:wabisabi_mob_app/widgets/dialog_boxes/milestone_view.dart';

class MilestonePreviewChip extends StatelessWidget {
  const MilestonePreviewChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAssets.chip,
            width: 8.w,
            height: 12.h,
          ),
          SizedBox(width: 7.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffB3B3B3)),
                  borderRadius: BorderRadius.circular(14.r),
                  color: AppColors.kScaffoldColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Freelance Design Project',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Color(0xff4A4A4A),
                        ),
                      ),
                      SizedBox(height: 17.h),
                      SizedBox(
                        width: 220.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xffE8E8E8),
                                value: 0.75,
                                color: AppColors.kPrimaryColor,
                                minHeight: 6.h,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '(75%)',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Spacer(),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$500.00',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            color: Color(0xff4A4A4A),
                          ),
                        ),
                        SizedBox(height: 17.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showEditMilestoneDialogBox(context);
                                },
                                child: SvgPicture.asset(
                                  svgAssets.edit2,
                                  width: 16.w,
                                  height: 18.h,
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showMilestoneViewDialogBox(context);
                                },
                                child: SvgPicture.asset(
                                  svgAssets.eye2,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
